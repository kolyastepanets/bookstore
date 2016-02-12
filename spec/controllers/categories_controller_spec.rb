require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:categories) { create_list(:category, 2) }
  let(:books) { create_list(:book, 2) }
  let(:category) { create(:category, books: books) }

  describe 'GET #show' do
    it 'has array of books' do
      get :show, id: category
      expect(assigns(:books)).to match_array(books)
    end

    it 'assigns category to @category' do
      get :show, id: category
      expect(assigns(:category)).to eq category
    end

    it 'renders show view' do
      get :show, id: category
      expect(response).to render_template :show
    end
  end
end