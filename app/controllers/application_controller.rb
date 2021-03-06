class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthHelper
  helper_method :signed_in?, :admin_signed_in?, :current_user
  before_filter :sign_in_by_token
  add_breadcrumb I18n.t('home'), :root_path
end
