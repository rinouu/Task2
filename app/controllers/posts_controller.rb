class PostsController < ApplicationController
	before_action :set_post, only: [:edit, :update, :show, :destroy]
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		if params[:back]
	  		render :new
		else
		    if @post.image.present?
		    	@picture = current_user
  				PictureMailer.picture_mail(@picture).deliver  ##Addendum
			end
	  		if @post.save
	    		redirect_to posts_path, notice: "Post created!"
	  		else
	    		render :new
	  		end
		end
	end

	def confirm
		@post = current_user.posts.build(post_params)
		render :new if @post.invalid?
	end

	def edit
	end

	def update
		if @post.update(post_params)
	  		redirect_to posts_path, notice: "Post edited!"
		else
	  		render :edit
		end
	end

	def show
		@favorite = current_user.favorites.find_by(post_id: @post.id)
	end

	def destroy
		@post.destroy
		redirect_to posts_path, notice:"Post deleted!"
	end

	private

	def post_params
		params.require(:post).permit(:content,:image,:image_cache)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
