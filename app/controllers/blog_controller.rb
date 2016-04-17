class BlogController < ApplicationController
  def index
    @body_class = "home-template enable-filter"
    if params[:query]
      @posts = Post.basic_search(params[:query])
    else
      @posts = Post.all
    end
  end

  def ajax_index
    if params[:query]
      @posts = Post.basic_search(params[:query])
    else
      @posts = Post.all
    end
    render json: @posts
  end

  def show
    @body_class = "post-template"
    @post = Post.find(params[:id])
  end

  private

  def body_class
    @body_class
  end
end
