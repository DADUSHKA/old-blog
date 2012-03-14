class Admin::PostsController < Admin::ApplicationController
  inherit_resources
  actions :index, :new, :create, :edit, :update, :destroy
end
