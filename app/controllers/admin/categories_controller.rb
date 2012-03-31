class Admin::CategoriesController < Admin::ApplicationController
  inherit_resources
  actions :index, :new, :create, :edit, :update, :destroy
  
  def index
    all = Category.all
    @categories = Category.sort_by_ancestry(all)
  end

  def new
    @category = Category.new
    @categories = Category.all
  end
end
