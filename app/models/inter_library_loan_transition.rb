class InterLibraryLoanTransition < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordTransition

  
  belongs_to :inter_library_loan, inverse_of: :inter_library_loan_transitions
end
