class HomeController < ApplicationController
  def index
    @newestPosts = Post.visible.newest.take(2)
    @figures = Figure.visible.all
    @featuredPosts = Post.visible.featured.newest.take(2)
  end

  def body_class
    "post-template"
  end
end
