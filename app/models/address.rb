class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  belongs_to :country

  validates :first_name, :last_name, :street, :city, :zip, :phone, :country, presence: true
  validates_numericality_of :zip, :phone
  validates_length_of :phone, in: 10..12
end