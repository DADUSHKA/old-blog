# coding: UTF-8

module AuthHelper
  extend ActiveSupport::Concern

  module InstanceMethods
    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def signed_in?
      session[:user_id]
    end
    
    def admin_signed_in?
      signed_in? && current_user.admin
    end

    def authenticate_user!
      unless signed_in?
        flash[:notice] = 'Необходимо авторизоваться'
        redirect_to new_user_session_path
      end
    end

    def authenticate_admin!
      unless current_user.admin?
        redirect_to new_user_session_path
      end
    end

    def current_user
      @current_user ||= session[:user_id] && User.find_by_id(session[:user_id]) ||  User::Guest.new
    end

    def sign_in_by_token
      if params[:auth_token].present?
        user = ::User.find_by_auth_token!(params[:auth_token])
        sign_in(user)
      end
    end
  end
end
