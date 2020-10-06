class MessageMailer < ApplicationMailer
  def message_mailer(email, name, message)
    @email = email
    @name = name
    @message = message
    mail(to: "raj@jcandsp.com", subject: "New message") 
  end
end
