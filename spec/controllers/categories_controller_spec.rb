require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:category) { FactoryGirl.create(:category) }
  let(:categories) { FactoryGirl.create_list(:category, 2) }
  let(:books) { FactoryGirl.create_list(:book, 2) }

  describe 'GET #show' do
    it 'has array of categories' do
      # get :show
      expect(assigns(:categories)).to match_array(categories)
    end

    it 'has array of books' do
      get :show
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