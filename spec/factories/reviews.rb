FactoryGirl.define do
  factory :review do
    title "MyString"
    content "MyText"
    book
    user
    value 1

    trait :invalid do
      title nil
      content nil
    end
  end
end
