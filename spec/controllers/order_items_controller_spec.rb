require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do

  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let!(:order_item) { create(:order_item, book: book) }

  describe 'POST #create' do
    before { sign_in(user) }

    context 'with valid atrributes' do
      it 'saves new order_item' do
        post :create, book_id: book
        expect(assigns(:order_item)).to_not be_nil
      end

      # it 'gets #add_book' do
      #   expect(order).to receive(:add_book).with(book, 1, price: book.price)
      #   # byebug
      #   post :create, book_id: book
      # end

      it 'redirects to order' do
        post :create, book_id: book, order_id: order, order_item: attributes_for(:order_item)
        expect(response).to redirect_to order_path(order)
      end
    end

    context 'with invalid attributes' do
      let(:order) { create(:order, user: user) }

      it 'does not save order_item' do
        expect { post :create, book_id: book, order_id: order, order_item: attributes_for(:order_item, :invalid) }.to_not change(OrderItem, :count)
      end

      it 'redirects to book' do
        post :create, book_id: book, order_item: attributes_for(:order_item, :invalid)
        expect(response).to redirect_to book_path(book)
      end
    end
  end

  let(:book1) { create(:book) }
  let!(:order_item1) { create(:order_item, book: book1) }
  let!(:order) { create(:order, order_items: [order_item, order_item1], user: user) }

  describe 'PATCH #update' do
    before { sign_in(user) }
    context "with valid attributes" do
      it "changes the order_item's quantity" do
        patch :update, id: order_item, order_id: order, order_item: { quantity: 10 }
        order_item.reload
        expect(order_item.quantity).to eq 10
      end

      it 'redirect to order' do
        patch :update, id: order_item, book_id: book, order_id: order, order_item: attributes_for(:order_item)
        expect(response).to redirect_to order_path(order)
      end
    end

  end

  describe 'DELETE #destroy' do
    before { sign_in(user) }

    context "with valid attributes" do
      it 'deletes order_item' do
        expect { delete :destroy, order_id: order, id: order_item }.to change(OrderItem, :count).by(-1)
      end

      it 'redirects to order' do
        delete :destroy, order_id: order, id: order_item
        expect(response).to redirect_to order_path(order)
      end
    end
  end
end