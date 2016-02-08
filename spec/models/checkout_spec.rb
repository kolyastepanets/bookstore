require 'rails_helper'

RSpec.describe Checkout, type: :model do
  it { should have_one(:order) }
end
