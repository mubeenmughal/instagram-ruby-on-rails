Rails.application.routes.draw do


  resources :homes

  resources :posts
  devise_for :users

  get "/dashboard" => "user#index"
  #get 'user/index'
  root 'home#index'

  # resources :post, only: [:new,:create,:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
