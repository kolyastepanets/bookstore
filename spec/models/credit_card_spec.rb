require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  it { should validate_presence_of(:cvv) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:expiration_year) }
  it { should validate_presence_of(:expiration_month) }

  it { should validate_numericality_of(:cvv) }
  it { should validate_numericality_of(:number) }
  it { should validate_numericality_of(:expiration_month) }

  # it { should validate_inclusion_of(:expiration_month).in_range(1..12) }
  it { should validate_numericality_of(:expiration_year).is_greater_than_or_equal_to(2016) }

  it "validates length of cvv" do
    credit_card = create(:credit_card, cvv: 123, number: 1234567812345678)

    expect(credit_card).to be_valid
  end

  it "validates length of number" do
    credit_card = create(:credit_card, number: 1234567812345678, cvv: 123)

    expect(credit_card).to be_valid
  end

  it { should belong_to(:order) }

end
