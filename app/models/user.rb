class User < ApplicationRecord
  after_create :create_cart
  
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

	def orders_qty
		qty = self.orders.count
	end

	def self.best_buyer
		best_buyer = User.first
		max_boughts = User.first.orders_qty
		self.all.each do |each_user|
			if each_user.orders_qty > max_boughts
				max_boughts = each_user.orders_qty
				best_buyer = each_user
			end
		end
		return best_buyer
	end

end
