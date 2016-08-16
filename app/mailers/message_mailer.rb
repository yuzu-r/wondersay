class MessageMailer < ApplicationMailer
  def contact(message)
    admin_email = ENV["ADMIN_EMAIL"]
    @message = message
    mail to: admin_email, subject: "Wondersays: message from #{message.name}"    
  end
end
