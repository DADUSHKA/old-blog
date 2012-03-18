class Post::TagsController < ApplicationController
  include ActsAsTaggableOn

  def index
    @tags = Post.tag_counts_on :tags
  end

  def show
    @tag = Tag.find params[:id]
    @posts = Post.tagged_with @tag.name #бред...
  end
end
