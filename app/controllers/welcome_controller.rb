class WelcomeController < ApplicationController
  def index
    @last_posts = Post.limit configus.welcome.item_limit
  end
end
