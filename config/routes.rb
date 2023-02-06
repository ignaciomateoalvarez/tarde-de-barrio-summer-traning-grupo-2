# frozen_string_literal: true

Rails.application.routes.draw do
  root 'user_sessions#new'
  get '/home', to: 'home#index'
  get '/register', to: 'home#register'

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  delete 'logout' => 'user_sessions#destroy', :as => :logout
end
