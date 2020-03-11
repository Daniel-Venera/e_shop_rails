class CartsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @cart = Cart.find(params[:id])
		@price_sum = @cart.price_sum 

  end

end
