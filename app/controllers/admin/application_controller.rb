class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_admin!
  add_breadcrumb I18n.t('admin'), :admin_root_path
end
