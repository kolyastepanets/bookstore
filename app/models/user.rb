class User < ActiveRecord::Base
  validates :firstname, :lastname, presence: true

  has_many :orders
  has_one :shipping_address, as: :addressable, class_name: "ShippingAddress"
  accepts_nested_attributes_for :shipping_address

  has_one :billing_address, as: :addressable, class_name: "BillingAddress"
  accepts_nested_attributes_for :billing_address

  scope :admin, -> { User.where(admin: true) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
