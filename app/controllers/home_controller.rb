class HomeController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').select {|post| post.visibility}
    @figures = Figure.all
  end

  def body_class
    "post-template"
  end
end
