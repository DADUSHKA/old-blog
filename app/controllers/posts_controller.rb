class PostsController < ApplicationController
  add_breadcrumb I18n.t('posts'), :posts_path
  
  def index 
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
    add_breadcrumb @post.title, post_path(@post)
  end
end
