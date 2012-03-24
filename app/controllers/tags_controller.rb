class TagsController < ApplicationController
  include ActsAsTaggableOn
  add_breadcrumb I18n.t('tags'), :tags_path

  def index
    @tags = Post.tag_counts_on :tags
  end

  def show
    @tag = Tag.find params[:id]
    @posts = Post.tagged_with @tag.name
    add_breadcrumb @tag.name, tag_path(@tag)
  end
end
