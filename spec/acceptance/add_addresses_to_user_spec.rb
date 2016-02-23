require 'rails_helper'

feature 'user can add addresses info', %q{
  in order not to fill in each time addresses in order
  i can to fill in addresses
} do

  given(:user) { create(:user) }
  given(:country) { create(:country) }
  given!(:countries) { create_list(:country, 2) }

  scenario 'filling billing address info' do
    visit root_path
    sign_in(user)

    click_on 'Settings'

    fill_in "user_billing_address_attributes_first_name", with: 'first_name'
    fill_in "user_billing_address_attributes_last_name", with: 'last_name'
    fill_in "user_billing_address_attributes_street", with: 'street'
    fill_in "user_billing_address_attributes_city", with: 'city'
    fill_in "user_billing_address_attributes_zip", with: 123
    fill_in "user_billing_address_attributes_phone", with: 12345678
    select "country_name1", :from => "user_billing_address_attributes_country_id"

    find('.save-billing-address').click

    expect(page).to have_content "Your settings has been updated successefully"

  end

  scenario 'filling shipping address info' do
    visit root_path
    sign_in(user)

    click_on 'Settings'
    # save_and_open_page

    fill_in "user_shipping_address_attributes_first_name", with: 'first_name'
    fill_in "user_shipping_address_attributes_last_name", with: 'last_name'
    fill_in "user_shipping_address_attributes_street", with: 'street'
    fill_in "user_shipping_address_attributes_city", with: 'city'
    fill_in "user_shipping_address_attributes_zip", with: 123123
    fill_in "user_shipping_address_attributes_phone", with: 1231212123
    select "country_name3", :from => "user_shipping_address_attributes_country_id"

    find('.save-shipping-address').click

    expect(page).to have_content "Your settings has been updated successefully"

  end

end
