class Review < ActiveRecord::Base
  validates :title, :content, presence: true
  validates_inclusion_of :value, in: 1..5

  belongs_to :book
  belongs_to :user
end
