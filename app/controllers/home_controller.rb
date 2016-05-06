class HomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").limit(4)
  end

  def body_class
    "post-template"
  end
end
