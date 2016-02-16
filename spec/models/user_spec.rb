require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:firstname) }
  it { should validate_presence_of(:lastname) }

  it { should have_many(:orders)}

  describe ".find_for_oauth" do
    let!(:user) { create(:user) }
    let(:auth) { OmniAuth::AuthHash.new(provider: 'facebook', uid: '123456') }

    context "user has already authorization" do
      it "returns user" do
        user.authorizations.create(provider: 'facebook', uid: '123456')
        expect(User.find_for_oauth(auth)).to eq user
      end
    end

    context "user does not have authorization" do
      context "user already exists" do
        let(:auth) { OmniAuth::AuthHash.new(provider: 'facebook', uid: '123456', info: { email: user.email }) }

        it "does not create user" do
          expect{ User.find_for_oauth(auth) }.to_not change(User, :count)
        end

        it "creates authorization for user" do
          expect{ User.find_for_oauth(auth) }.to change(user.authorizations, :count).by(1)
        end

        it "creates authorization with provider and uid" do
          user = User.find_for_oauth(auth)
          authorization = user.authorizations.first

          expect(authorization.provider).to eq auth.provider
          expect(authorization.uid).to eq auth.uid
        end

        it "returns user" do
          expect(User.find_for_oauth(auth)).to eq user
        end

      end

      context "user does not exist" do
        let(:auth) { OmniAuth::AuthHash.new(provider: 'facebook', uid: '123456', info: { email: 'new@user.com', first_name: "fname", last_name: "lname" }) }

        it "creates new user" do
          expect { User.find_for_oauth(auth) }.to change(User, :count).by(1)
        end

        it "returns user" do
          expect(User.find_for_oauth(auth)).to be_a(User)
        end

        it "fills user email" do
          user = User.find_for_oauth(auth)
          expect(user.email).to eq auth.info.email
          expect(user.firstname).to eq auth.info.first_name
          expect(user.lastname).to eq auth.info.last_name
        end

        it "creates authorization for user" do
          user = User.find_for_oauth(auth)
          expect(user.authorizations).to_not be_empty
        end

        it "creates authorization with provider and uid" do
          authorization = User.find_for_oauth(auth).authorizations.first

          expect(authorization.provider).to eq auth.provider
          expect(authorization.uid).to eq auth.uid
        end
      end

    end
  end
end
