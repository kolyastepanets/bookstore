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

    alias_action :read, :update, :destroy, :to => :rud
    can :rud, [Order], user_id: user.id
    can :new, [Review]
    can :create, [Review, OrderItem]
    can :destroy, [OrderItem]
    can :edit, [User]
    can :update, [User]
    can :update_password, [User]

  end

end
