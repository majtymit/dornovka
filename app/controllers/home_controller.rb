class HomeController < ApplicationController
  def index
    @body_class = "home-template enable-filter"
    @posts = Post.all
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
