# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :homes
  resources :posts
  resources :stories
  resources :follows, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
  resources :user do
    get 'search', on: :collection
  end

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
