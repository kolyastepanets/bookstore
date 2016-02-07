require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:street) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:first_name) }

  it { should validate_numericality_of(:zip) }
  it { should validate_numericality_of(:phone) }

  it "validates length of phone" do
    address = create(:address, phone: 1234567891)

    expect(address).to be_valid
  end
end
