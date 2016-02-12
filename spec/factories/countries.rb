FactoryGirl.define do
  sequence :name do |n|
    "test_name#{n}"
  end

  factory :country do
    name
  end

end
