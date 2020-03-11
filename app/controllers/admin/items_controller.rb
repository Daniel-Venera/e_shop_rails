module Admin
	class ItemsController < ApplicationController
#		before_action :require_admin

		def index
			@items = Item.all
		end

		def new 
			@item = Item.new
		end 

		def create
			puts params
			item_params = params[:item]
			@item = Item.new(title: item_params[:title], description: item_params[:description], price: item_params[:price].to_i)
			if @item.save	
				flash[:success] = "Item created"
				redirect_to admin_items_path
			else
				flash[:danger] = "Item NOT created, please check your params"
				puts @item.errors.messages
				redirect_to new_admin_item_path
			end
		end 

		def destroy
			puts params
			@item = Item.find(params[:id])
			@item.destroy
		end

		private

		def require_admin
			unless isAdmin?
				flash[:error] = "Vous devez etre Administrateur pour repertorier une photo"
				redirect_to root_path
			end
		end
	end
end
