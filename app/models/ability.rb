class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, ActiveAdmin::Page, name: 'Dashboard'

    if user.guest?
      can :read, Student
      can :read, Course
    end

    if user.admin?
      can :manage, ActiveAdmin::Page, name: 'Migrate'
      can :manage, :all
    end
  end
end
