 class UserMailer < ActionMailer::Base
  default from: "being-mindful.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email(user)
    @user = user

    @url = "being-mindful.herokuapp.com"
    mail to: "user.email", subject: "Being Mindful [welcome]"
  end
end
