class PartnersController < ApplicationController
  def index
    @partners = Partner.order("position ASC").all
  end

  def show
    impressionist(@partner)
  end


  def body_class
    "post-template"
  end
end
