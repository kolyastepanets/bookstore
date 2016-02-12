require 'rails_helper'

feature 'user can navigate site by categories', %q{
  in order to find book quicker
  i want to be able to slide by categories
} do


  scenario 'user visit category' do
    category = create(:category)
    book1 = create(:book)
    book2 = create(:book)
    book3 = create(:book, category: category)
    book4 = create(:book, category: category)

    visit root_path
    click_on 'Shop'
    visit category_path(category)

    # save_and_open_page

    expect(page).to have_content book3.title
    expect(page).to have_content book4.title

  end


end
