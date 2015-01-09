class InterLibraryLoanStateMachine
  include Statesman::Machine

  state :pending, initial: true
  state :requested
  state :shipped
  state :received
  state :return_shipped
  state :return_received

  transition from: :pending, to: :requested
  transition from: :requested, to: :shipped
  transition from: :shipped, to: :received
  transition from: :received, to: :return_shipped
  transition from: :return_shipped, to: :return_received

  before_transition(to: :shipped) do |inter_library_loan|
    inter_library_loan.ship
  end

  before_transition(to: :received) do |inter_library_loan|
    inter_library_loan.do_receive
  end

  before_transition(to: :return_shipped) do |inter_library_loan|
    inter_library_loan.do_return_ship
  end

  before_transition(to: :return_received) do |inter_library_loan|
    inter_library_loan.do_return_receive
  end
end
