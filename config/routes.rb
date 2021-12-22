Rails.application.routes.draw do

  # post 'stories/create'
  # get 'stories/show'
  # get 'stories/new'
  devise_for :users
  resources :comments
  resources :homes
  resources :posts
  resources :stories

  resources :user, :only => [:show]
  get "profile" => "user#profile" , as: :profile

  get "post/like/:post_id" => "likes#save_like" , as: :like
  get "/dashboard" => "user#index"
  get "/users/search", to: "user#search"


  post "follow/user" => "posts#follow_user", as: :follow_account
  post "follow/user/:id" => "posts#unfollow_user", as: :unfollow_account
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
