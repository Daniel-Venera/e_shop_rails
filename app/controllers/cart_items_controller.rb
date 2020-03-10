class CartItemsController < ApplicationController 
  before_action :authenticate_user!

  def create
    @cart_item = CartItem.new
    puts "!" * 60
    puts params
    puts "!" * 60
    @cart_item.item = Item.find(params[:item_id])
    @cart_item.cart = current_user.cart
    if @cart_item.save
      flash[:success] = "You have added this item to your cart"
      redirect_to item_path(params[:item_id])
    else
      flash[:warning] = "You have not added this item to your cart"
      redirect_to item_path(params[:item_id])
    end
  end
end
