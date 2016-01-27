class Category < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true

  has_many :books
end