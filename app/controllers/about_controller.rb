class AboutController < ApplicationController
  def index
    @certificates = Certificate.order("position ASC")
    @faqs = Faq.order("position ASC")
    @timelines = Timeline.order("position DESC")
  end

  def body_class
    "post-template"
  end
end
