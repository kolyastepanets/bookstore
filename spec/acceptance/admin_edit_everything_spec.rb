require 'rails_helper'

feature 'admin can edit info', %q{
  in order to correct info
  i want to be able edit everything
} do

  given(:user) { create(:user, admin: true) }
  given!(:book) { create(:book) }
  given!(:category1) { create(:category) }
  given!(:category2) { create(:category) }
  given!(:author) { create(:author) }

  scenario 'admin edits book' do
    visit root_path
    sign_in(user)

    visit rails_admin.dashboard_path
    visit rails_admin.edit_path(model_name: 'Book', id: book.id)

    fill_in "book_title", with: 'new_title'
    fill_in "book_description", with: 'new_description'
    fill_in "book_price", with: '100'
    fill_in "book_books_in_stock", with: '20'
    click_on "Save"

    # save_and_open_page

    expect(page).to have_content "Book successfully updated"
    expect(page).to have_content "new_title"
    expect(page).to have_content "new_description"
    expect(page).to have_content "100"
    expect(page).to have_content "20"
    expect(current_path).to eq rails_admin.index_path(model_name: 'book')
  end

  scenario 'admin edits author' do
    visit root_path
    sign_in(user)

    visit rails_admin.dashboard_path
    visit rails_admin.edit_path(model_name: 'Author', id: author.id)

    fill_in "author_firstname", with: 'new_name'
    fill_in "author_lastname", with: 'new_lastname'
    fill_in "author_biography", with: 'new_biography'
    click_on "Save"

    # save_and_open_page

    expect(page).to have_content "Author successfully updated"
    expect(page).to have_content "new_name"
    expect(page).to have_content "new_lastname"
    expect(page).to have_content "new_biography"
    expect(current_path).to eq rails_admin.index_path(model_name: 'author')
  end

end
