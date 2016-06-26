class BlogController < ApplicationController
  before_filter :set_body_class, only: [:index, :show]
  before_filter :set_posts, only: [:index, :ajax_index]

  def index
  end

  def ajax_index
    render layout: false
  end

  def show
    @post = Post.find(params[:id])
    impressionist(@post)
  end

  private

  def set_posts
    @posts = Post.includes(:blogpictures).visible.newest.query(params[:query])
      #.paginate(page: params[:page], per_page: 15)
  end

  def set_body_class
    @body_class =
      case params[:action]
      when "index" then "post-template enable-filter"
      when "show" then "post-template"
      end
  end
end
