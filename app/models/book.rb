class Book < ActiveRecord::Base
  validates :title, :price, :books_in_stock, presence: true

  belongs_to :author
  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :order_items

  scope :bestsellers, -> { Book.select("books.*, sum(order_items.quantity) as total").joins(:order_items).group(:id).order('total DESC').limit(3) }

end
