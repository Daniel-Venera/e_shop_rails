class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items
    has_many :items, through: :cart_items

		def price_sum
			sum = 0
			self.items.each do |each_item|
				sum += each_item.price
			end
			return sum
		end

end
