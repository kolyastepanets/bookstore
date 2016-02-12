FactoryGirl.define do
  sequence :name do |n|
    "country_name#{n}"
  end

  factory :country do
    name
  end

end
