class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  private

  def body_class
    "home-template enable-filter"
  end
end
