class AboutController < ApplicationController
  def index
    @posts = Post.all
  end

  private

  def body_class
    "post-template"
  end
end
