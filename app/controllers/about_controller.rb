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

    respond_to do |format|
      if @contact.save
        @contact.email = nil
        ContactMailer.new_contact(@contact).deliver_now
        format.html
        format.json
        format.js
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
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
