require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:book2) { create(:book) }
  let!(:order_item) { create(:order_item, book: book) }
  let!(:order_item2) { create(:order_item, book: book2) }
  let!(:order) { create(:order, order_items: [order_item, order_item2], user: user) }

  before do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    expect(@controller).to receive(:current_ability).and_return(@ability)
    @ability.can :manage, :all

    sign_in(user)
  end

  describe 'GET #show' do
    before { get :show, id: order, user: user }

    it 'assigns order to @order' do
      expect(assigns(:order)).to eq order
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

  describe 'PATCH #update' do
    context "with valid attributes" do
    before { allow(controller).to receive(:current_order).and_return(order) }

      it "changes the order_item's quantity" do
        patch :update, id: order_item, order_id: order, items: { order_item.id => { quantity: 2 } }
        # binding.pry
        expect(assigns(:order)).not_to be_nil
      end

      it 'redirect to order' do
        patch :update, id: order_item, items: { order_item.id => { quantity: 2 } }
        expect(response).to redirect_to cart_path(order)
      end
    end
  end

  describe 'DELETE #destroy' do
    before { order }

    it 'deletes order' do
      expect { delete :destroy, id: order }.to change(Order, :count).by(-1)
    end

    it 'redirect to book path' do
      delete :destroy, id: order
      expect(response).to redirect_to books_path
    end
  end
end
