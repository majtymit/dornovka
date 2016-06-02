class AboutController < ApplicationController
  def index
    @certificates = Certificate.order("position ASC")
    @faqs = Faq.order("position ASC")
    @timelines = Timeline.order("position DESC")
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

      if @contact.save
        ContactMailer.new_contact(@contact).deliver_now
        ContactMailer.copy_for_sender(@contact).deliver_now
        flash[:success] = "Ďakujem za Váš e-mail. Jeho kópia bola odoslaná na #{@contact.email}"
        redirect_to about_url(anchor: "4")
      else
        flash[:error] = "Nastala chyba, e-mail nebol odoslaný!"
        render "new"
      end
  end

  def hovno
    @contact = Contact.new(user_params)
    flash[:notice] = "Task was successfully created." if @contact.save
  end

  private

  def user_params
    params.require(:contact).permit(:email, :subject, :message)
  end
end
