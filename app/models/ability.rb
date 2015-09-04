class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  
        if user.role.to_s == 'admin'
            can :manage, :all  #admin full role
        else 
            can :read, :all #not admin is read not create and edit
        end
  end
end
