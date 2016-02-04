require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  let(:orders) { create_list(:order, 2, user: user) }

  describe 'GET #index' do
    before { sign_in(user) }
    before { get :index }

    it 'has array of orders' do
      expect(assigns(:orders)).to match_array(orders)
    end

    it 'render index' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { sign_in(user) }
    before { get :show, id: order, user: user }

    it 'assigns order to @order' do
      expect(assigns(:order)).to eq order
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
