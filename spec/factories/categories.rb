FactoryGirl.define do
  sequence :title do |n|
    "title_test_#{n}"
  end

  factory :category do
    title
  end

end
