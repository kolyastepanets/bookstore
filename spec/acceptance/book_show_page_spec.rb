require 'rails_helper'

feature 'user can view detaile info about book', %q{
  in order to find out about book more info
  i want to be able to enter book page
} do


  scenario 'user book page' do

    category = create(:category)
    book1 = create(:book)
    book2 = create(:book)

    visit root_path
    click_on 'Shop'
    visit book_path(book1)

    # save_and_open_page

    expect(page).to have_content book1.title
    expect(page).to have_content book1.description
    expect(page).to have_content book1.price

  end

end
