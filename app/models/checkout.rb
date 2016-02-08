class Checkout < ActiveRecord::Base
  has_one :order
end
