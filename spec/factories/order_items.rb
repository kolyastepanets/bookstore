FactoryGirl.define do
  factory :order_item do
    price 9.99
    quantity 1
    book
    order

    trait :invalid do
      quantity nil
      price nil
    end
  end

end
