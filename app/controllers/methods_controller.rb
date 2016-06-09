class MethodsController < ApplicationController
  def index
    @therapies = Therapy.visible.order("position ASC")
  end

  def body_class
    "post-template"
  end
end