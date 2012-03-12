class PostsController < InheritedResources::Base
  actions :index, :new, :create, :edit, :update, :destroy
end
