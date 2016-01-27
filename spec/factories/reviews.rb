FactoryGirl.define do
  factory :review do
    title "MyString"
    content "MyText"
    book_id 1
    user_id 1
    value 1

    trait :invalid do
      title nil
      content nil
    end
  end
end
