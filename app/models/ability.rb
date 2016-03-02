class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user
      user.admin? ? admin_abilities : user_abilities
    else
      guest_abilities
      alias_action :show, :update, :destroy, :to => :sud
      can :sud, [Order]
    end
  end

  def guest_abilities
    can :read, [Book, Category, Author]
    can :create, [OrderItem]
    can :destroy, [OrderItem]
  end

  def admin_abilities
    can :manage, :all
  end

  def user_abilities
    guest_abilities

    alias_action :read, :update, :destroy, :to => :rud
    can :rud, [Order], user_id: user.id
    can :new, [Review]
    can :create, [Review]
    can :edit, [User], id: user.id
    can :update, [User], id: user.id
    can :update_password, [User], id: user.id

  end

end
