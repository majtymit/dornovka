class BlogController < ApplicationController
  before_filter :set_body_class, only: [:index, :show]

  def index
    @posts = Post.visible.query(params[:query])
  end

  def ajax_index
    @posts = Post.visible.query(params[:query])

    render layout: false
  end

  def show
    @post = Post.find(params[:id])
    impressionist(@post)
  end

  private

  def set_body_class
    @body_class =
      case params[:action]
      when "index" then "post-template enable-filter"
      when "show" then "post-template"
      end
  end
end
