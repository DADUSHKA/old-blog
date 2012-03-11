class User::SessionsController < ApplicationController
  def new
  end

  def create
    user = ::User.active.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      sign_in user 
      flash[:success] = t('sign_in')
      redirect_to :root
    else
      flash[:error] = t("wrong_auth_data")
      render :action => :new
    end
  end

  def destroy
    sign_out
    redirect_to :root, :success => t("logout")
  end
end
