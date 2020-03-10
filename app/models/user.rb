class User < ApplicationRecord
  after_create :create_cart
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :cart 




  def create_cart 
    puts "==========================================="
    puts "je suis dans la methode create"
    puts self
    puts "==========================================="
    @cart = Cart.new(user: self)
    @cart.save
    self.cart = @cart
    self.save
  end

end
