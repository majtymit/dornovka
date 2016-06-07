class FaqsController < ApplicationController
  def index
    @faqs = Faq.visible.order("position ASC")
  end

  def body_class
    "post-template"
  end
end