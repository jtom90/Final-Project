class WelcomeController < ApplicationController
	def index
		@user = User.new
	end

	def create
		@post = Post.new
	end
end