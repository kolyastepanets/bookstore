require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:book) { FactoryGirl.create(:book) }
  let(:review) { FactoryGirl.create(:review, book: book) }

  describe 'GET #new' do
    sign_in_user

    before do
      get :new, { book_id: book.id }
    end

    it 'creates new review' do
      expect(assigns(:review)).to be_a_new(Review)
    end

    it 'renders #new' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    sign_in_user

    context 'with valid atrributes' do
      it 'saves new review with book_id' do
        expect { post :create, book_id: book, review: FactoryGirl.attributes_for(:review) }.to change(Review, :count).by(1)
      end

      it 'assigns review to book_id' do
        post :create, book_id: book, review: FactoryGirl.attributes_for(:review)
        review = assigns(:review)
        expect(review.user_id).to eq @user.id
        expect(review.book_id).to eq book.id
      end

      it 'redirects to show @book' do
        post :create, book_id: book, review: FactoryGirl.attributes_for(:review)
        expect(response).to redirect_to book_path(book)
      end
    end

    context 'with invalid attributes' do
      it 'does not save review' do
        expect { post :create, book_id: book, review: FactoryGirl.attributes_for(:review, :invalid) }.to_not change(Review, :count)
      end

      it 'redirect to #new' do
        post :create, book_id: book, review: FactoryGirl.attributes_for(:review, :invalid)
        expect(response).to render_template :new
      end
    end
  end
end
