class Order < ApplicationRecord
	after_create :command_send
	belongs_to :user
	has_many :order_items, dependent: :destroy
	has_many :items, through: :order_items

	def command_send
		UserMailer.command_email(self).deliver_now
	end

	def price_sum
		sum = 0
		self.items.each do |each_item|
			sum += each_item.price
		end
		return sum 
	end

	def self.ca
		ca = 0
		Order.all.each do |each_order|
			ca += each_order.price_sum	
		end
		return ca
	end

end
