class AboutController < ApplicationController
  def index
    @certificates = Certificate.order("position ASC")
  end

  def body_class
    "post-template"
  end
end
