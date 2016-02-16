# require 'rails_helper'

# RSpec.describe CheckoutsController, type: :controller do
#   let(:user) { create(:user) }
#   let(:book) { create(:book) }
#   let!(:order) { create(:order, user: user) }
#   let!(:order_item) { create(:order_item, book: book, order: order) }
#   let(:country) { create(:country) }
#   let(:countries) { create_list(:country, 2) }
#   let(:delivery) { create(:delivery) }
#   let(:deliveries) { create_list(:delivery, 2) }

#   describe 'GET #address' do
#     before { sign_in(user) }
#     before { get :address }

#     it 'calls build_both_addresses on order' do
#       order.build_both_addresses
#       expect(order.billing_address).to_not be_nil
#       expect(order.shipping_address).to_not be_nil
#     end

#     it "has array of countries" do
#       expect(assigns(:countries)).to match_array(countries)
#     end

#     it 'render address' do
#       expect(response).to render_template :address
#     end
#   end

#   describe "PATCH #update_address" do
#     sign_in_user
#     let(:billing_address) { create(:address) }
#     let(:shipping_address) { create(:address) }

#     context 'valid attributes' do
#       it "assigns order.address" do
#         patch :update_address, id: billing_address.id, id: shipping_address.id, order_id: order,
#                                    billing_address: attributes_for(:billing_address),
#                                    shipping_address: attributes_for(:shipping_address)
#         expect(assigns(order.billing_address)).not_to be_nil
#         expect(assigns(order.shipping_address)).not_to be_nil
#       end

#       # it "redirects to delivery page" do
#       #   patch :update_address, id: billing_address.id, id: shipping_address, order_id: order,
#       #                              billing_address: attributes_for(:billing_address),
#       #                              shipping_address: attributes_for(:shipping_address)
#       #   expect(response).to redirect_to checkouts_delivery_path
#       # end


#     end

#     context 'invalid attributes' do
#     end
#   end

#   describe "GET #delivery" do
#     before { sign_in(user) }
#     before { get :delivery }

#     it "returns array of deliveries" do
#       expect(assigns(:deliveries)).to match_array(deliveries)
#     end

#     it 'render delivery' do
#       expect(response).to render_template :delivery
#     end
#   end

#   describe "PATCH #update_delivery" do

#   end

#   describe 'GET #payment' do
#     before { sign_in(user) }
#     before { get :payment }

#     it 'calls building_credit_card on order' do
#       order.building_credit_card
#       expect(order.credit_card).to_not be_nil
#     end

#     it 'render payment' do
#       expect(response).to render_template :payment
#     end
#   end

#   describe "PATCH #update_payment" do
#     sign_in_user
#     let(:credit_card) { create(:credit_card) }
#     let(:order_item1) { create(:order_item, book: book) }
#     let(:order_item2) { create(:order_item, book: book) }
#     let(:order1) { create(:order, order_items: [order_item1, order_item2], user: user, credit_card: credit_card) }
#     let(:billing_address) { create(:billing_address) }
#     let(:shipping_address) { create(:shipping_address) }

#     before do
#       allow(order1).to receive(:billing_address) { billing_address }
#       allow(order1).to receive(:shipping_address) { shipping_address }
#       allow(order1).to receive(:delivery) { delivery }
#     end

#     context 'valid attributes' do
#       it "assigns order.credit_card" do
#         patch :update_payment, id: credit_card.id, order_id: order1, credit_card: attributes_for(:credit_card)
#         expect(assigns(order.credit_card)).not_to be_nil
#       end

#       # it "receives update for order.credit_card" do
#       #   expect(order1.credit_card).to receive(:update_attributes).with(attributes_for(:credit_card))
#       #   patch :update_payment, id: credit_card.id, order_id: order1, credit_card: attributes_for(:credit_card)
#       # end

#       # it "redirects to paymen page" do
#       #   patch :update_payment, id: credit_card.id, order_id: order1, credit_card: attributes_for(:credit_card)
#       #   byebug
#       #   expect(response).to redirect_to checkouts_confirm_path
#       # end
#     end

#     # context 'invalid attributes' do
#       # it "assigns order.credit_card" do
#         # patch :update_payment, id: credit_card.id, order_id: order1, credit_card: attributes_for(:credit_card, :invalid)
#         # byebug
#         # expect(response).to redirect_to checkouts_payment_path
#       # end

#     # end
#   end

#   describe 'GET #confirm' do

#     before do
#       allow(controller).to receive(:check_confirm) { false }
#       sign_in(user)
#       get :confirm
#     end

#     it 'returns order if everything is valid' do
#       credit_card = create(:credit_card, order: order)
#       expect(order.credit_card).to be_valid
#     end

#     it 'does not return if credit_card invalid' do
#       # byebug
#       expect(order.credit_card).to be_nil
#     end

#     it 'render payment' do
#       expect(response).to render_template :confirm
#     end

#   end

#   describe "PATCH #place_order" do
#   end

# end
