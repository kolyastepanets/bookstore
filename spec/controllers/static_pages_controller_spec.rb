require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  let!(:book1) { create(:book) }
  let!(:book2) { create(:book) }
  let!(:book3) { create(:book) }
  let!(:book4) { create(:book) }
  let!(:book5) { create(:book) }

  let!(:order_item1) { create(:order_item, book: book1) }
  let!(:order_item2) { create(:order_item, book: book2) }
  let!(:order_item3) { create(:order_item, book: book3, quantity: 5) }
  let!(:order_item4) { create(:order_item, book: book4, quantity: 10) }
  let!(:order_item5) { create(:order_item, book: book5, quantity: 15) }

  describe 'GET #index' do
    before { get :home }

    it 'match to specific array of books' do
      expect(Book.bestsellers).to eq [book5, book4, book3]
    end

    it 'render home' do
      expect(response).to render_template :home
    end
  end
end
