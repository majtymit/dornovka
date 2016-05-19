class BlogController < ApplicationController

  def index
    @body_class = "post-template enable-filter"
    if params[:query]
      @posts = Post.query(params[:query])
    else
      @posts = Post.order("created_at DESC, title ASC")
    end
  end

  def ajax_index
    if params[:query]
      @posts = Post.query(params[:query])
    else
      @posts = Post.all
    end
    render json: @posts
  end

  def show
    @body_class = "post-template"
    @post = Post.find(params[:id])
    impressionist(@post)
  end

  private

  def body_class
    @body_class
  end
end
