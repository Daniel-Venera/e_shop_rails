class Order < ApplicationRecord
	after_create :command_send
	belongs_to :user
	has_many :order_items, dependent: :destroy
	has_many :items, through: :order_items

	def price_sum
		sum = 0
		self.items.each do |each_item|
			sum += each_item.price
		end
		return sum
	end

	def command_send
		UserMailer.command_email(self).deliver_now
	end

end
