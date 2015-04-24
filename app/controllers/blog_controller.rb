class BlogController < ApplicationController
  def index
    @posts = Post.all
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id]
    @posts = @posts.query(params[:query]) if params[:query]

    @latest_posts = Post.last(3)
  end

  def show
    @post = Post.find(params[:id])

    @latest_posts = Post.last(3)
  end
end
