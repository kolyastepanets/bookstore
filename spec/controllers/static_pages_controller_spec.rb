require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  let(:book) { double(Book) }

  describe 'GET #home' do
    before do
      allow(Book).to receive(:all).and_return(book)
      allow(book).to receive(:page).and_return(book)
      allow(book).to receive(:per).and_return(book)
    end

    it 'returns 1 book per page' do
      expect(book).to receive(:per).with(1)
      get :home
    end
  end
end
