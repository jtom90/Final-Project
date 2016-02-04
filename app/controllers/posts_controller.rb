class PostsController < ApplicationController
	def index
		@user = User.new
		@user = current_user
	end

	def new
		@post = Post.new
		@user = User.new
		@user = current_user

		@ip = request.remote_ip

		if @ip == "::1"
			@ip = "24.42.118.135"
		end

		@user_location = Geocoder.search(@ip).first
	end

	def create
		@post = Post.new(post_params)
    	@post.user = current_user

	    if @post.save
	      flash[:notice] = "Image posted!"
	      redirect_to new_post_path
	    else
	      flash[:alert] = "Image Upload failed!!! :-( #{@post.errors.full_messages.join('')}"
	      redirect_to new_post_path
	    end
    end

	def show
		@user = current_user
		@post = Post.all

		@ip = request.remote_ip

		if @ip == "::1"
			@ip = "24.42.118.135"
		end

		@user_location = Geocoder.search(@ip).first
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "Your post has been deleted"
	end

private

  def post_params
    params.require(:post).permit(:avatar, :image, :content, :id, :latitude, :longitude, :ip_address)
  end
end