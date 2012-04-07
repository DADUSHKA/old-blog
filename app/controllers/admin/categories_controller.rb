class Admin::CategoriesController < Admin::ApplicationController
  inherit_resources
  actions :index, :new, :create, :edit, :update, :destroy
  add_breadcrumb I18n.t('categories'), :admin_categories_path

  def index
    all = Category.all
    @categories = Category.sort_by_ancestry(all)
  end

  def new
    @category = Category.new
    @categories = Category.all
    add_breadcrumb I18n.t('new'), new_admin_category_path(@category)
  end
end
