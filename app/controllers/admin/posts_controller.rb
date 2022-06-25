class Admin::PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def index
		@posts = Post.all
	end
	
	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to admin_post_path(@post)
	end

	def edit
		@post = Post.find(params[:id])
	end
	
	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to admin_posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :image)
	end
end
