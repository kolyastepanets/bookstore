class User < ActiveRecord::Base
  validates :firstname, :lastname, presence: true

  has_many :orders
  has_many :authorizations, dependent: :destroy
  has_one :shipping_address, as: :addressable, class_name: "ShippingAddress"
  accepts_nested_attributes_for :shipping_address

  has_one :billing_address, as: :addressable, class_name: "BillingAddress"
  accepts_nested_attributes_for :billing_address

  scope :admin, -> { User.where(admin: true) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable, omniauth_providers: [:facebook]


  def self.find_for_oauth(auth)
    authorization = Authorization.where(provider: auth.provider, uid: auth.uid).first
    return authorization.user if authorization
    # byebug
    email = auth.info[:email]
    firstname = auth.info[:first_name]
    lastname = auth.info[:last_name]
    user = User.where(email: email).first

    if user
      user.authorizations.create(provider: auth.provider, uid: auth.uid)
    else
      password = Devise.friendly_token[0, 20]
      user = User.create!(email: email, firstname: firstname, lastname: lastname, password: password, password_confirmation: password)
      user.authorizations.create(provider: auth.provider, uid: auth.uid)
    end
    user
  end

end
