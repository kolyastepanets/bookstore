require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  let(:author) { create(:author) }
  describe 'GET #show' do
    before { get :show, id: author }

    it 'assigns author to @author' do
      expect(assigns(:author)).to eq author
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
