class Ability
  include CanCan::Ability

  def initialize(user)
    case user.try(:role).try(:name)
    when 'Administrator'
      can :manage, InterLibraryLoan
    when 'Librarian'
      can :manage, InterLibraryLoan
    end
  end
end
