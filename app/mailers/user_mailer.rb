class UserMailer < ActionMailer::Base
  default :from => configus.emails.sender_email

  def new_user(user)
    @user = user
    mail(:to => user.email)
  end

  def reset_password(user)
    @user = user
    mail(:to => user.email)
  end
end
