require 'rails_helper'

RSpec.describe CheckoutsController, type: :controller do
  let(:user) { create(:user) }
  let!(:order) { create(:order) }
  let!(:checkout) { create(:checkout, order: order) }

  describe 'GET #address' do
    before { sign_in(user) }
    before { get :address }

    it 'assigns checkout to checkout' do
      expect(assigns(:checkout)).to eq checkout
    end

    it 'render address' do
      expect(response).to render_template :address
    end
  end
end
