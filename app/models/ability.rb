class Ability

  include CanCan::Ability

  def initializer(user)
    if user.role == "admin"
      can :create, Badge
    else
      can :read, :all
  end
end