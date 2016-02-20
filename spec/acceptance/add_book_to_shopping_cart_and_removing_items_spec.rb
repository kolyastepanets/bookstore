require 'rails_helper'

feature 'user can add book to cart and delete from cart', %q{
  in order to buy book
  i want to be able to add book to cart
  and to destroy from cart
} do

  before do
    allow_any_instance_of(ActionController::Base).to receive(:protect_against_forgery?).and_return(false)
  end

  given(:user) { create(:user) }
  given(:book1) { create(:book) }
  given(:book2) { create(:book) }
  given(:order) { create(:order, user: user) }

  scenario 'adding book to cart' do
    visit root_path
    sign_in(user)

    click_on 'Shop'
    visit book_path(book1)

    click_on "Add to Cart"
    # save_and_open_page

    expect(page).to have_content book1.title
    expect(page).to have_link "EMPTY CART"
    expect(page).to have_link "CONTINUE SHOPPING"
    expect(page).to have_button "Update"
    expect(page).to have_link "CHECKOUT"
  end

  scenario "removing from cart" do
    visit root_path
    sign_in(user)
    click_on 'Shop'

    visit book_path(book1)
    click_on "Add to Cart"

    visit book_path(book2)
    click_on "Add to Cart"

    click_on "EMPTY CART"
    # save_and_open_page

    expect(current_path).to eq books_path

  end

end
