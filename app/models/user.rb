class User < ApplicationRecord
  after_create :create_cart
  after_create :welcome_send
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :cart, dependent: :destroy
	has_many :orders


  def create_cart
    @cart = Cart.new(id: self.id, user: self)
    @cart.save
    self.cart = @cart
    self.save
  end

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
