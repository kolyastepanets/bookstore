FactoryGirl.define do
  factory :book do
    title
    description "MyText"
    price 10
    books_in_stock 1
    author
    category
  end
end
