# frozen_string_literal: true

Rails.application.routes.draw do
  root 'user_sessions#login'

  get 'login' => 'user_sessions#login', :as => :login
  get 'register' => 'user_sessions#register', :as => :register
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout
  resources :users, only: [:index]
end
