class UserMailer < ApplicationMailer
  default from: 'everyone@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = new_session_url
    mail(to: 'test@testing.com', subject: 'Welcome to 99 Cats!')
  end
end
