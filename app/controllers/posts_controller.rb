class PostsController < ApplicationController
	def index
		@user = User.new
		@user = current_user
	end
	def new
		@post = Post.new
		@user = User.new
		@user = current_user
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
	end

	def edit
		@post = Post.find(params[:id])
	end

private

  def post_params
    params.require(:post).permit(:avatar, :image, :content, :id)
  end
end