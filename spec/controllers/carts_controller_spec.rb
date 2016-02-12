require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }

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

  describe 'DELETE #destroy' do
    before { sign_in(user) }

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
