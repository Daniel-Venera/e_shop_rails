class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to user_cart_path(current_user.id, current_user.cart.id)
  end

  def create
    @cart_item = CartItem.new
    puts "!" * 60
    puts params
    puts "!" * 60
    @cart_item.item = Item.find(params[:item_id])
    @cart_item.cart = current_user.cart
    if @cart_item.save
      flash[:success] = "You have added this item to your cart"
      redirect_to user_cart_path(current_user.id, current_user.id)
    else
      flash[:warning] = "You have not added this item to your cart"
      redirect_to item_path(params[:item_id])
    end
  end
end
