class Order < ApplicationRecord
	after_create :command_send
	after_create :admin_send
	belongs_to :user
	has_many :order_items, dependent: :destroy
	has_many :items, through: :order_items
	

	def command_send
		UserMailer.command_email(self).deliver_now
	end

	def admin_send
		AdminMailer.order_email(self).deliver_now
	end

end
