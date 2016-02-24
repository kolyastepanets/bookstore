require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:book2) { create(:book) }
  let!(:order_item) { create(:order_item, book: book) }
  let!(:order_item2) { create(:order_item, book: book2) }
  let!(:order) { create(:order, order_items: [order_item, order_item2], user: user) }
  let(:country) { create(:country) }
  let!(:countries) { create_list(:country, 2) }
  let(:delivery) { create(:delivery) }
  let(:deliveries) { create_list(:delivery, 2) }

  before do
    allow(controller).to receive(:current_order).and_return(order)
  end

  describe "GET #show" do
    sign_in_user

    context "address" do
      it 'expect to assign countries' do
        get :show, id: :address
        expect(assigns(:countries)).not_to be_nil
      end

      it 'expect to receive build_addresses' do
        expect(order).to receive(:build_both_addresses)
        get :show, id: :address
      end

      it "render address" do
        get :show, id: :address
        expect(response).to render_template('address')
      end
    end

    context "delivery" do
      before do
        allow(order).to receive(:billing_address).and_return(true)
        allow(order).to receive(:shipping_address).and_return(true)
      end

      it 'expect to assign deliveries' do
        get :show, id: :delivery
        expect(assigns(:deliveries)).not_to be_nil
      end

      it "render delivery" do
        get :show, id: :delivery
        expect(response).to render_template('delivery')
      end
    end

    context "payment" do
       before do
        allow(order).to receive(:delivery).and_return(true)
      end

      it 'expect credit_card not to be nil' do
        get :show, id: :delivery
        expect(assigns(order.credit_card)).not_to be_nil
      end

      it "render payment" do
        get :show, id: :payment
        expect(response).to render_template('payment')
      end
    end

    context "confirm" do
      before do
        allow(order).to receive(:credit_card).and_return(true)
      end

      it 'expect assigns to order' do
        get :show, id: :confirm
        expect(assigns(:order)).to eq order
      end

      it "render confirm" do
        get :show, id: :confirm
        expect(response).to render_template('confirm')
      end
    end

  end

  describe "PATCH #update" do

    # context "address" do
    #   it 'expect to assign countries' do
    #     patch :update, id: :address
    #     expect(assigns(:countries)).not_to be_nil
    #   end

 #      it "updates addresses" do
 #        patch :update, id: :address, order: {:billing_address_attributes=>
 #  {"first_name"=>"123", "last_name"=>"123", "street"=>"123123", "city"=>"123123", "zip"=>"12313", "phone"=>"12313", "country_id"=>"1"},
 # :shipping_address_attributes=>
 #  {"first_name"=>"123", "last_name"=>"123", "street"=>"123123", "city"=>"123123", "zip"=>"12313", "phone"=>"12313", "country_id"=>"1"} }

 #        binding.pry
 #        expect(order.billing_address).to exist
 #      end
    # end

    # context "delivery" do
    #   it "updates delivery" do
    #     patch :update, { id: :delivery, order: { delivery_id: delivery.id } }
    #     patch :update, {'id' => 'delivery', "order" => { "delivery_id" => delivery.id.to_s }}
    #     expect(order.delivery).to_not be_nil
    #   end
    # end

    # context "confirm" do
    #   it "changes state's order" do
    #     patch :update, {'id' => 'confirm'}
    #     binding.pry
    #     expect(order).to have_state(:in_processing)
    #   end
    # end

  end

end
