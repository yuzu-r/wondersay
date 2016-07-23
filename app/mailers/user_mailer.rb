class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_approved.subject
  #
  def account_approved(user)
    @greeting = "Hi"
    @user = user
    mail to: user.email, subject: "Wondersays: account approved!"
  end

  def new_user_waiting_for_approval(user)
    @greeting = "Hi"
    admin_email = Rails.application.secrets.ADMIN_EMAIL
    mail to: admin_email, subject: "Wondersays: new account requires approval"    
  end
end
