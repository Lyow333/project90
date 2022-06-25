class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.order(:title).page params[:page]
  end

  def ditum
    @post = Post.find(params[:id])
    if @post.view_count.present?
      @ditum = @post.view_count.ditum.to_i + 1
      @post.view_count.update(ditum: @ditum)
      redirect_to post_path(@post)
    else
      @view_count = @post.create_view_count(ditum: 1)
      @view_count.save
      redirect_to post_path(@post)
    end
  end
end