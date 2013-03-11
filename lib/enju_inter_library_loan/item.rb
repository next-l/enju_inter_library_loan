module EnjuInterLibraryLoan
  module InterLibraryLoanItem
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def enju_inter_library_loan_item_model
        include InstanceMethods
        has_many :inter_library_loans, :dependent => :destroy
      end
    end

    module InstanceMethods
      def inter_library_loaned?
        true if self.inter_library_loans.size > 0
      end
    end
  end
end
