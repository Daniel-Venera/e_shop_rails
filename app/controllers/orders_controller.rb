class OrdersController < ApplicationController
	before_action :authenticate_user!

	def show
		puts params	
	end

	def create
		puts "=" * 60
		puts params
		puts "=" * 60

		@user = User.find(params[:user_id])
		@order = Order.new 
		@order.user = @user
		@order.save
		
		@cart = @user.cart
		@cart.items.each do |each_item|	
			order_item = OrderItem.new
			order_item.item = each_item
			order_item.order = @order
			order_item.save
		end
		CartItem.where(cart: @cart).destroy_all

		# redirect_to user_cart_order_path(current_user.id, current_user.cart.id, @order.id)	
	end
end
