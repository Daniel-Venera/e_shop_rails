class OrdersController < ApplicationController
	before_action :authenticate_user!

	def show
		puts params	
	end


end
