class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #params[:user][:admin] = false #TODO use types
    @user = User.new(params[:user])
    @user.generate_confirmation_token
    if @user.save
      UserMailer.new_user(@user).deliver
      @user.email_confirmation_sended
      redirect_to :root
    else
      render :action => :new
    end
  end
end
