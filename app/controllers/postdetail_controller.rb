class PostdetailController < ApplicationController
  def index
    @posts = Post.all
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id]
    @posts = @posts.search(params[:query]) if params[:query]

    @latest_posts = Post.last(3)
  end

  def show
    @post = Post.find(params[:id])

    @latest_posts = Post.last(3)
  end

  def body_class
    "post-template"
  end

end