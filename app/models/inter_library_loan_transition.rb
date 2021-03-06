class InterLibraryLoanTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  
  belongs_to :inter_library_loan, inverse_of: :inter_library_loan_transitions
  #attr_accessible :to_state, :sort_key, :metadata
end

# == Schema Information
#
# Table name: inter_library_loan_transitions
#
#  id                    :integer          not null, primary key
#  to_state              :string
#  metadata              :text             default({})
#  sort_key              :integer
#  inter_library_loan_id :integer
#  created_at            :datetime
#  updated_at            :datetime
#  most_recent           :boolean          not null
#
