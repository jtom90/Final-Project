class UsersController < ApplicationController
	def index
		@user = User.new
	end

	def show
		@user = current_user
		@ip = request.remote_ip

		if @ip == "::1"
			@ip = "24.42.118.135"
		end

		@user_location = Geocoder.search(@ip).first
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to Posts_path, :notice => "Your post has been deleted"
	end
end