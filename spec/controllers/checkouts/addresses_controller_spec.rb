require 'rails_helper'

RSpec.describe Checkouts::AddressesController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let!(:order) { create(:order, user: user) }
  let!(:order_item) { create(:order_item, book: book, order: order) }
  let(:country) { create(:country) }
  let(:countries) { create_list(:country, 2) }
  let(:delivery) { create(:delivery) }
  let(:deliveries) { create_list(:delivery, 2) }

  describe 'GET #edit' do
    before { sign_in(user) }
    before { get :edit, id: order }

    it 'calls build_both_addresses on order' do
      order.build_both_addresses
      expect(order.billing_address).to_not be_nil
      expect(order.shipping_address).to_not be_nil
    end

    it "has array of countries" do
      expect(assigns(:countries)).to match_array(countries)
    end

    it 'render edit' do
      expect(response).to render_template :edit
    end
  end
end
