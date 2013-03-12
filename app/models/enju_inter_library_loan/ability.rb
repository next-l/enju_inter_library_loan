module EnjuInterLibraryLoan
  class Ability
    include CanCan::Ability

    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can :manage, InterLibraryLoan
      when 'Librarian'
        can :manage, InterLibraryLoan
      end
    end
  end
end
