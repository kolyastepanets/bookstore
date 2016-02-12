class OrderItem < ActiveRecord::Base
  before_save :finalize

  validates_numericality_of :quantity, presence: true, only_integer: true, greater_than_or_equal_to: 1

  belongs_to :book
  belongs_to :order


  def unit_price
    if persisted?
      self.price
    else
      book.price
    end
  end

  def total_price
    unit_price * quantity
  end

  private

    def finalize
      self.price = unit_price
    end

end