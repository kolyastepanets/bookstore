class User < ActiveRecord::Base
  validates :firstname, :lastname, presence: true

  has_many :orders
  has_one :shipping_address, as: :addressable, class_name: "ShippingAddress"
  has_one :billing_address, as: :addressable, class_name: "BillingAddress"

  def current_admin
    current_user && current_user.admin
  end

  scope :admin, -> { User.where(admin: true) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
