require 'rails_helper'

feature 'user can register' do

  scenario 'not signed in and not signed up user tries to sign up' do
    visit root_path

    click_on 'Sign up'
    # save_and_open_page

    fill_in "user_firstname", with: "user_firstname"
    fill_in "user_lastname", with: "user_lastname"
    fill_in "user_email", with: "user@email.com"
    fill_in "user_password", with: "12345678"
    fill_in 'user_password_confirmation', with: "12345678"

    within(".products") do
      click_on 'Sign up'
    end

    expect(page).to have_link "Sign out"
  end

  scenario 'registration false' do
    visit root_path

    click_on 'Sign up'

    fill_in "user_firstname", with: "user_firstname"
    fill_in "user_lastname", with: "user_lastname"
    fill_in "user_email", with: ""
    fill_in "user_password", with: "12345678"
    fill_in 'user_password_confirmation', with: "12345678"

    within(".products") do
      click_on 'Sign up'
    end
    # save_and_open_page

    expect(page).to_not have_link "Sign out"
    expect(page).to have_content "Email can't be blank"
  end

end
