require "enju_inter_library_loan/engine"
require "enju_inter_library_loan/item"

module EnjuInterLibraryLoan
end

ActiveRecord::Base.send :include, EnjuInterLibraryLoan::InterLibraryLoanItem
