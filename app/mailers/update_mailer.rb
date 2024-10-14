class UpdateMailer < ApplicationMailer

  def update_email(user)
    @user = user
    mail(
      from: "testingcredentials23@gmail.com",
      to: @user.email,
      subject: 'Welcome to My Awesome Site')
  end
end
