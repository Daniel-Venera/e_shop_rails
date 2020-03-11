class ChargesController < ApplicationController
	def new
		@cart = current_user.cart
		@amount = @cart.price_sum * 100
	end

	def create

		# Amounts in cents
		@cart = current_user.cart
		@amount = @cart.price_sum * 100

		customer = Stripe::Customer.create({
			email: params[:stripeEmail],
			source: params[:stripeToken],
		})

		charge = Stripe::Charge.create({
			customer: customer.id,
			amount: @amount.to_i,
			description: 'Rails Stripe customer',
			currency: 'eur',
		})

		if charge
			@order = Order.new
			@order.user = current_user
			@order.save
			@cart = current_user.cart
			@cart.items.each do |each_item|
				order_item = OrderItem.new
				order_item.item = each_item
				order_item.order = @order
				order_item.save
			end
			CartItem.where(cart: @cart).destroy_all
		else
			flash[:error] = "Probleme lors de la creation de la commande ou lors du paiement."
			redirect_to user_cart_path(current_user.id, current_user.cart.id)
		end

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_user_cart_charge_path
	end
end
