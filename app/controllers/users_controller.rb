class UsersController < ApplicationController
	def index
		@user = User.new
	end

	def show
		@user = current_user
	end
end