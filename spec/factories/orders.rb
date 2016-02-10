FactoryGirl.define do
  factory :order do
    total_price "9.99"
    completed_date "2016-01-29"
    aasm_state "in_progress"
    user
    # delivery
    # credit_card
  end
end
