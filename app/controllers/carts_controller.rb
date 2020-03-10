class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @cart = Cart.find(params[:id])
		@price_sum = 0

		@cart.items.each do |each_item|
			@price_sum += each_item.price
		end
  end
end
