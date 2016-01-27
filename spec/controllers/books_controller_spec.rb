require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { FactoryGirl.create(:book) }
  let(:category) { FactoryGirl.create(:category) }

  describe 'GET #index' do
    let(:books) { FactoryGirl.create_list(:book, 2) }
    let(:categories) { FactoryGirl.create_list(:category, 2) }

    before { get :index }

    it 'has array of books' do
      expect(assigns(:books)).to match_array(books)
    end

    it 'has array of categories' do
      expect(assigns(:categories)).to match_array(categories)
    end

    it 'render index' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, id: book }

    it 'assigns book to @book' do
      expect(assigns(:book)).to eq book
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
