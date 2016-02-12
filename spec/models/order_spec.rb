require 'rails_helper'
require 'byebug'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:aasm_state) }
  it { should validate_presence_of(:completed_date) }

  it { should belong_to(:user) }
  it { should belong_to(:delivery) }

  it { should have_many(:order_items).dependent(:destroy) }
  it { should have_one(:credit_card) }



  let(:order) { create(:order) }
  let(:book1) { create(:book) }
  let(:book2) { create(:book, price: 100) }

  context "#total_price" do
    it "counts total price" do
      order.add_book(book1.id, 1)
      order.add_book(book2.id, 1)
      order.add_book(book2.id, 1)
      expect(order.total_price).to eq (210)
    end
  end

  context "#add_book" do
    let(:order_item) { create(:order_item, order: order) }

    it "increases quantity if order_item exist" do
      order.add_book(order_item.book, 1, 10)
      order_item.reload
      expect(order_item.quantity).to eq(2)
    end

    it "creates new order item" do
      order.add_book(book1, 1, 10)
      expect(order.order_items.size).to eq 1
    end
  end

  context "#update_total_price" do
    it "updates total price before save" do
      order = build(:order)
      expect(order).to receive(:update_total_price)
      order.save
    end
  end
end
