require 'rails_helper'

feature 'user can register' do

  scenario 'not signed in and not signed up user tries to sign up' do
    within(".panel-body")do
      click_on 'Sign up'
    end
    screenshot_and_open_image
    save_and_open_page
      fill_in "firstname", with: user.firstname
      fill_in "lastname", with: user.lastname
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in 'password_confirmation', with: "12345678"
      click_on 'Sign up'

    # visit root_path

    expect(page).to have_link "Sign out"
  end

  # scenario 'registration false' do
  # end

end
