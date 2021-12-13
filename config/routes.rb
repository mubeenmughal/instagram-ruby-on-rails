Rails.application.routes.draw do

  devise_for :users
  resources :comments
  resources :homes
  resources :posts


  get "profile/:name" => "user#profile" , as: :profile
  get "post/like/:post_id" => "likes#save_like" , as: :like
  get "/dashboard" => "user#index"
  #get 'user/index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
