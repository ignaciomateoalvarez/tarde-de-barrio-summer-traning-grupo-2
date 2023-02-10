# frozen_string_literal: true

Rails.application.routes.draw do
  root 'user_sessions#new'

  get 'login' => 'user_sessions#new', :as => :login
  get 'register' => 'user_registrations#new', :as => :new
  post 'register' => 'user_registrations#create'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users do
    put 'toggle_active' => 'users#toggle_active'
    put 'update_role' => 'users#update_role', on: :member
  end
end
