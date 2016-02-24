require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:book2) { create(:book) }
  let(:order) { create(:order, user: user) }
  let(:order_item) { create(:order_item, book: book) }

  describe 'POST #create' do
    before { allow(controller).to receive(:current_order).and_return(order) }
    sign_in_user

    context 'with valid atrributes' do
      it 'saves new order_item' do
        post :create, book_id: book
        expect(assigns(:order)).to_not be_nil
      end

      it 'gets #add_book' do
        order.add_book(book.id, 1, book.price)
        expect(order.order_items).to_not be_empty
      end

      it 'redirects to cart_path' do
        post :create, book_id: book
        expect(response).to redirect_to cart_path
      end
    end

    context 'with invalid attributes' do
      before { allow(order).to receive(:add_book).and_return(false) }

      it 'redirects to book' do
        post :create, book_id: book
        expect(response).to redirect_to book_path(book)
      end
    end
  end

  describe 'DELETE #destroy' do

    let!(:order_item1) { create(:order_item, book: book) }
    let!(:order_item2) { create(:order_item, book: book2) }
    let!(:order1) { create(:order, order_items: [order_item1, order_item2], user: user) }
    sign_in_user
    context "with valid attributes" do
      before { allow(controller).to receive(:current_order).and_return(order1) }
      before { allow(OrderItem).to receive(:find).and_return(order_item1) }
      it 'deletes order_item' do
        expect { delete :destroy, order_id: order1, id: order_item1 }.to change(OrderItem, :count).by(-1)
      end

      it 'redirects to order' do
        delete :destroy, order_id: order1, id: order_item1
        expect(response).to redirect_to cart_path
      end
    end
  end
end
