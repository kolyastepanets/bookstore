require 'rails_helper'

feature 'user can navigate site by categories', %q{
  in order to find book quicker
  i want to be able to slide by categories
} do

  given(:user) { create(:user) }

  scenario 'user visit category' do
    book1 = create(:book)
    sign_in(user)
    visit root_path
    click_on 'Shop'
    visit book_path(book1)

    click_on "Add review for this book"

    select "5", :from => "review_value"
    # save_and_open_page
    fill_in "review_title", with: 'first_title'
    fill_in "review_content", with: 'content'

    click_on "ADD"


    expect(page).to have_content "first_title"
    expect(page).to have_content "content"
    expect(page).to have_content "5"

  end


end
