class UserMailer < ApplicationMailer
  default from: 'everyone@app_academy.io'

  def welcome_email(user)
    @user = user
    @url = 
  end
end
