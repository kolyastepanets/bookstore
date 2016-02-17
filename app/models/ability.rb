class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    if user
      user.admin? ? admin_abilities : user_abilities
    else
      guest_abilities
    end
  end

  def guest_abilities
    can :read, [Book, Category, Author]
  end

  def admin_abilities
    can :manage, :all
  end

  def user_abilities
    guest_abilities

    can :read, [Order]
    can :new, [Review]
    can :edit, [Order]
    can :create, [Review, OrderItem]
    can :update, [Order]
    can :destroy, [Order, OrderItem]
  end

end