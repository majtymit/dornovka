class PartnersController < ApplicationController
  def index
    @partners = Partner.order("position ASC").all
  end

  def show
    @partner = Partner.find(params[:id])
    impressionist(@partner)
  end


  def body_class
    "post-template"
  end
end
