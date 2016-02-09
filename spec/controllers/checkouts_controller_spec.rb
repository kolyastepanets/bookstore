require 'rails_helper'

RSpec.describe CheckoutsController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let!(:order) { create(:order, user: user) }
  let!(:order_item) { create(:order_item, book: book, order: order) }
  let(:country) { create(:country) }
  let(:countries) { create_list(:country, 2) }
  let(:delivery) { create(:delivery) }
  let(:deliveries) { create_list(:delivery, 2) }

  describe 'GET #address' do
    before { sign_in(user) }
    before { get :address }

    it 'calls build_both_addresses on order' do
      order.build_both_addresses
      expect(order.billing_address).to_not be_nil
      expect(order.shipping_address).to_not be_nil
    end

    it "has array of countries" do
      expect(assigns(:countries)).to match_array(countries)
    end

    it 'render address' do
      expect(response).to render_template :address
    end
  end

   #  describe "PATCH #update_address" do
   #    sign_in_user
   #    let(:billing_address) { create(:address) }
   #    let(:order1) { create(:order, billing_address: billing_address, user: user) }
   #    let(:order_item1) { create(:order_item, book: book, order: order1) }
   # #    before { order.create_billing_address!("id"=>"1","first_name"=>"qwerty",
   #             # "last_name"=>"qwerty",
   #             # "street"=>"qwerty",
   #             # "city"=>"qwerty",
   #             # "country_id"=>"2",
   #             # "zip"=>"123",
   #             # "phone"=>"1231212123",
   #             # "created_at"=>"10",
   #             # "updated_at"=>"12") }

   #    context 'valid attributes' do
   #      it "updates attributes for addresses" do
   #        # byebug
   #        patch :update_address, id: order1.billing_address.id, order_id: order1, order1.billing_address=> { street: "new street" }
   #        order1.reload
   #        # byebug
   #        expect(order1.billing_address.street).to eq "new street"
   #      end

   #    end

   #    context 'invalid attributes' do
   #    end
   #  end

  describe "GET #delivery" do
    before { sign_in(user) }
    before { get :delivery }

    it "returns array of deliveries" do
      expect(assigns(:deliveries)).to match_array(deliveries)
    end

    it 'render delivery' do
      expect(response).to render_template :delivery
    end
  end

  describe 'GET #payment' do
    before { sign_in(user) }
    before { get :payment }

    it 'calls building_credit_card on order' do
      order.building_credit_card
      expect(order.credit_card).to_not be_nil
    end

    it 'render payment' do
      expect(response).to render_template :payment
    end
  end

  # describe "PATCH #update_payment" do
  #   sign_in_user
  #   let(:credit_card) { create(:credit_card) }
  #   let(:order1) { create(:order, credit_card: credit_card, user: user) }

  #   context 'valid attributes' do
  #     it "updates attributes" do
  #       # byebug
  #       patch :update_payment, id: credit_card, order_id: order1, credit_card: { expiration_year: 2020 }
  #       order1.reload
  #       # byebug
  #       expect(order1.credit_card.expiration_year).to eq 2020
  #     end

  #   end

  #   context 'invalid attributes' do
  #   end
  # end
end
