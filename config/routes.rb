Blog::Application.routes.draw do
  root to: redirect("/posts")

  namespace :admin do
    root :to => 'posts#index'
    resources :posts
    resources :users
    resources :categories
  end

  resource :user, :only => [:new, :create] do
    scope :module => :user do
      resource :session, :only => [:new, :create, :destroy]
      resource :confirmation, :only => [:create]
      resource :password_instruction, :only => [:new, :create] 
    end
  end

  resources :posts, :only => [:index, :show]
  resources :tags, :only => [:index, :show]  
  resources :categories, :only => [:index, :show]
end
