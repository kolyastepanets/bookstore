require 'rails_helper'

feature 'user can view orders', %q{
  in order to view status of each order
  i can visit orders page
} do

  given(:user) { create(:user) }
  given(:book1) { create(:book) }
  given(:order) { create(:order) }
  given(:country) { create(:country) }
  given!(:countries) { create_list(:country, 2) }
  given!(:deliveries) { create_list(:delivery, 2) }

  scenario 'filling in order info' do
    visit root_path
    sign_in(user)

    click_on 'Shop'
    visit book_path(book1)

    click_on "Add to Cart"
    click_on "CHECKOUT"

    fill_in "order_billing_address_attributes_first_name", with: 'first_name'
    fill_in "order_billing_address_attributes_last_name", with: 'last_name'
    fill_in "order_billing_address_attributes_street", with: 'street'
    fill_in "order_billing_address_attributes_city", with: 'city'
    fill_in "order_billing_address_attributes_zip", with: 123
    fill_in "order_billing_address_attributes_phone", with: 12345678
    select "country_name9", :from => "order_billing_address_attributes_country_id"
    # save_and_open_page

    fill_in "order_shipping_address_attributes_first_name", with: 'first_name'
    fill_in "order_shipping_address_attributes_last_name", with: 'last_name'
    fill_in "order_shipping_address_attributes_street", with: 'street'
    fill_in "order_shipping_address_attributes_city", with: 'city'
    fill_in "order_shipping_address_attributes_zip", with: 123123
    fill_in "order_shipping_address_attributes_phone", with: 1231212123
    select "country_name10", :from => "order_shipping_address_attributes_country_id"

    click_on "SAVE AND CONTINUE"


    choose('order_delivery_id_1', true)
    click_on "SAVE AND CONTINUE"


    fill_in "order_credit_card_attributes_number", with: 1234123412341234
    select "12", :from => "order_credit_card_attributes_expiration_month"
    select "2017", :from => "order_credit_card_attributes_expiration_year"
    fill_in "order_credit_card_attributes_cvv", with: 123
    click_on "SAVE AND CONTINUE"

    click_on "PLACE ORDER"

    click_on "Orders"

    expect(page).to have_content order.total_price
  end

end
