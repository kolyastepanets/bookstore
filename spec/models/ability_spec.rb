require 'rails_helper'

describe Ability do
  subject(:ability) { Ability.new(user) }

  describe 'for guest' do
    let(:user) { nil }

    it { should be_able_to :read, Book }
    it { should be_able_to :read, Author }
    it { should be_able_to :read, Category }

    it { should be_able_to :show, Order }
    it { should be_able_to :update, Order }
    it { should be_able_to :destroy, Order }

    it { should be_able_to :create, OrderItem }
    it { should be_able_to :destroy, OrderItem }
  end

  describe 'for admin' do
    let(:user) { create :user, admin: true }

    it { should be_able_to :manage, :all }
  end

  describe 'for user' do
    let(:user) { create :user }
    let(:other_user) { create :user }

    it { should be_able_to :read, create(:order, user: user), user: user }
    it { should_not be_able_to :read, create(:order, user: other_user), user: user }

    it { should be_able_to :update, create(:order, user: user), user: user }
    it { should_not be_able_to :update, create(:order, user: other_user), user: user }

    it { should be_able_to :destroy, create(:order, user: user), user: user }
    it { should_not be_able_to :destroy, create(:order, user: other_user), user: user }

    it { should be_able_to :new, Review }
    it { should be_able_to :create, Review }

    it { should be_able_to :edit, user }
    it { should be_able_to :update, user }
    it { should be_able_to :update_password, user }

  end

end
