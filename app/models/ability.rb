class Ability
  include CanCan::Ability

  def initialize(user)

#    :read => :index, :get, :edit
#    :manage => :create, :update, :delete

    can :read, ActiveAdmin::Page, name: 'Dashboard'

    if user.guest?
      can :read, Student
      can :read, Course
    end

#    if user.empresa?
#      students = user.empresa.students
#      session[:students_ids] = students.to_ids
#      can :manage, ActiveAdmin::Page, name: 'Migrate'
#    end

    if user.admin?
      can :manage, ActiveAdmin::Page, name: 'Migrate'
      can :manage, :all
    end
  end
end
