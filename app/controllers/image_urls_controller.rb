class ImageUrlsController < ApplicationController
	def create
		@item = Item.find(params[:item_id])
		@item.image_url.attach(params[:image_url])
		redirect_to(item_path(@item))
	end
end
