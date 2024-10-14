class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    mail(
      from: "testingcredentials23@gmail.com",
      to: @user.email,
      subject: 'Welcome to My Awesome Site')
  end
end
