class PartnersController < ApplicationController
  def index
    @partners = Partner.visible.order("position ASC")
  end

  def show
    partner = Partner.find(params[:id])
    impressionist(partner)
    redirect_to "http://#{partner.link}"
  end

  def body_class
    "post-template"
  end
end
