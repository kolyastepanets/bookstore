require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  it { should validate_inclusion_of(:value).in_range(1..10) }

  it { should belong_to(:book) }
  it { should belong_to(:user) }
end
