require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:user) { create(:user) }

  sign_in_user

  before do
    allow(controller).to receive(:current_user) { user }
  end

  describe 'PATCH #update_password' do
    context 'valid attributes' do

      before { allow(user).to receive(:update_with_password) { true } }

      it 'assigns to user ' do
        patch :update_password, id: user, user: { current_password: "12345678", password: "qwertyui" }
        # binding.pry
        expect(assigns(:user)).to_not be_nil
      end

      it 'receives update_with_password' do
        expect(user).to receive(:update_with_password)
        patch :update_password, user: { current_password: "12345678", password: "qwertyui" }
      end

      it "redirects to edit registration path" do
        patch :update_password, user: { current_password: "12345678", password: "qwertyui" }
        expect(response).to redirect_to edit_user_registration_path
      end
    end

    context 'invalid password' do
      before { allow(user).to receive(:update_with_password) { false } }

      before { patch :update_password, id: user, user: { current_password: "12345678", password: nil } }

      it 'renders #edit' do
        expect(response).to render_template :edit
      end
    end

  end
end
