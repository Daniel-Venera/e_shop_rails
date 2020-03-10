class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def show
		puts params
		@user = User.find(params[:id])
	end
end
