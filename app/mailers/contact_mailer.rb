class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_contact.subject
  #
  def new_contact(contact)
    @contact = contact

    mail to: "hena.vegesiova@gmail.com", cc: @contact.email, reply_to: @contact.email, subject: @contact.subject
  end

  def copy_for_sender(contact)
    @contact = contact

    mail to: @contact.email, reply_to: "hena.vegesiova@gmail.com", subject: "#{@contact.subject} - copy"
  end
end

# mail(to: "", bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])