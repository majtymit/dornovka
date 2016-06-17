class AboutController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @certificates = Certificate.visible.order("position ASC")
    @faqs = Faq.visible.order("position ASC")
    @timelines = Timeline.visible.order("position DESC")
    @contacts = Contact.all
    @contact = Contact.new
  end

  def body_class
    "post-template"
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(user_params)

      if Rails.env.production?
        if verify_recaptcha && @contact.save
          ContactMailer.new_contact(@contact).deliver_now
          #ContactMailer.copy_for_sender(@contact).deliver_now
          flash[:success] = "Ďakujem za Váš e-mail. Jeho kópia bola odoslaná na #{@contact.email}"
          redirect_to about_url(anchor: "kontakt")
        else
          flash[:danger] = "Nastala chyba, e-mail nebol odoslaný!"
          redirect_to about_url(anchor: "kontakt")
        end
      else
        if @contact.save
          ContactMailer.new_contact(@contact).deliver_now
          #ContactMailer.copy_for_sender(@contact).deliver_now
          flash[:success] = "Ďakujem za Váš e-mail. Jeho kópia bola odoslaná na #{@contact.email}"
          redirect_to about_url(anchor: "kontakt")
        else
          flash[:danger] = "Nastala chyba, e-mail nebol odoslaný!"
          redirect_to about_url(anchor: "kontakt")
        end
      end
  end

  private

    def user_params
      params.require(:contact).permit(:email, :subject, :message)
    end
end
