require 'rails_helper'

feature 'user sign in', %q{
  in order to be able to buy smth
  as an user
  i want to be able to sign in
} do

  given(:user) { create(:user) }

  scenario 'registered user tries to sign in' do
    sign_in(user)
      # screenshot_and_open_image

    expect(page).to have_link "Sign out"

    expect(current_path).to eq root_path
  end

  scenario 'unregistered user tries to sign in' do
    visit new_user_session_path

    within(".panel-body") do
      fill_in "user_email", with: 'wrong@test.com'
      fill_in "user_password", with: '12345678'
      click_on 'Sign in'
    end

    expect(page).to have_content 'Invalid email or password'
    expect("/").to eq root_path
  end

end
