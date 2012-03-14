class Admin::UsersController < Admin::ApplicationController
  inherit_resources
  actions :index, :edit, :update, :destroy
end
