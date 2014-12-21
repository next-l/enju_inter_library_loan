class InterLibraryLoan < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  scope :completed, -> {in_state(:return_received)}
  scope :processing, lambda {|item, borrowing_library| where('item_id = ? AND borrowing_library_id = ?', item.id, borrowing_library.id)}

  belongs_to :item, validate: true
  #belongs_to :reserve
  belongs_to :borrowing_library, foreign_key: 'borrowing_library_id', class_name: 'Library', validate: true

  validates_presence_of :item_id, :borrowing_library_id
  validates_associated :item, :borrowing_library
  validate :check_library, on: :create

  attr_accessor :item_identifier

  paginates_per 10

  def state_machine
    InterLibraryLoanStateMachine.new(self, transition_class: InterLibraryLoanTransition)
  end

  has_many :inter_library_loan_transitions

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
    to: :state_machine

  def check_library
    if item and borrowing_library
      unless InterLibraryLoan.processing(item, borrowing_library).blank?
        errors.add(:borrowing_library)
        errors.add(:item_identifier)
      end
    end
  end

  def do_request
    InterLibraryLoan.transaction do
      item.update_attributes({:circulation_status => CirculationStatus.where(:name => 'Recalled').first})
      update_attributes({:requested_at => Time.zone.now})
    end
  end

  def ship
    InterLibraryLoan.transaction do
      item.update_attributes({:circulation_status => CirculationStatus.where(:name => 'In Transit Between Library Locations').first})
      update_attributes({:shipped_at => Time.zone.now})
    end
  end

  def receive
    InterLibraryLoan.transaction do
      item.update_attributes({:circulation_status => CirculationStatus.where(:name => 'In Process').first})
      update_attributes({:received_at => Time.zone.now})
    end
  end

  def return_ship
    InterLibraryLoan.transaction do
      item.update_attributes({:circulation_status => CirculationStatus.where(:name => 'In Transit Between Library Locations').first})
      update_attributes({:return_shipped_at => Time.zone.now})
    end
  end

  def return_receive
    InterLibraryLoan.transaction do
      # TODO: 'Waiting To Be Reshelved'
      item.update_attributes({:circulation_status => CirculationStatus.where(:name => 'Available On Shelf').first})
      update_attributes({:return_received_at => Time.zone.now})
    end
  end

  private
  def self.transition_class
    InterLibraryLoanTransition
  end

  def self.initial_state
    OrderStateMachine.initial_state
  end
end

# == Schema Information
#
# Table name: inter_library_loans
#
#  id                   :integer          not null, primary key
#  item_id              :integer          not null
#  borrowing_library_id :integer          not null
#  requested_at         :datetime
#  shipped_at           :datetime
#  received_at          :datetime
#  return_shipped_at    :datetime
#  return_received_at   :datetime
#  deleted_at           :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
