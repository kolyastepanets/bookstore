FactoryGirl.define do
  factory :book do
    title "MyString"
    description "MyText"
    price "9.99"
    books_in_stock 1
    author
    category
  end
end
