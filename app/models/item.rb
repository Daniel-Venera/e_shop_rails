class Item < ApplicationRecord    
    validates :title, 
    presence: true
    validates_length_of :title,
    minimum: 5


    validates :description, 
    presence: true
    validates_length_of :description,
    minimum: 10
    
    validates :price, 
    presence: true,
    numericality: {greater_than_or_equal_to: 5}

    validates :image_url, 
    presence: true

    has_many :cart_items, dependent: :destroy
    has_many :carts, through: :cart_items 

		has_many :order_items, dependent: :destroy
		has_many :orders, through: :order_items
    
    has_one_attached :image_url 
end
