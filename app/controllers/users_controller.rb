class UsersController < ApplicationController
	def show
		puts params
		@user = User.find(params[:id])
	end
end
