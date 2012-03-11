class User::PasswordInstructionsController < ApplicationController
  def new
  end

  def create
    user = ::User.non_blocked.find_by_email(params[:user][:email])
    if user
      user.generate_auth_token
      user.save
      UserMailer.reset_password(user).deliver
      flash[:success] = t('password_instruction.flash.notice')
      redirect_to root_path
    else
      flash[:error] = t('password_instruction.flash.error')
      render :action => :new
    end
  end
end
