class SendMail < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.send_mail.new_mail.subject
  #
  def new_mail(mail)
    @email = email

    mail to: "majtymit@gmail.com", subject: "novy mail"
  end
end
