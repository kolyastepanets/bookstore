require 'rails_helper'

feature 'user signout', %q{
  user can sign out
} do

  before do
    allow_any_instance_of(ActionController::Base).to receive(:protect_against_forgery?).and_return(false)
  end

  given(:user) { create(:user) }

  scenario 'user signs out' do
    visit root_path
    sign_in(user)

    click_link "Sign out"

    expect(page).to have_link "Sign in"

  end
end
