class AboutController < ApplicationController
  def index
    @posts = Post.all
  end
end
