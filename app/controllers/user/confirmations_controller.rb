class User::ConfirmationsController < ApplicationController
  def create
    user = ::User.find_by_confirmation_token!(params[:token])
    user.confirm!
    sign_in user
    redirect_to root_path, :notice => t('web.messages.users.confirmed')
  end
end
