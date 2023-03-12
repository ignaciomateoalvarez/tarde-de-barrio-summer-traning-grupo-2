# frozen_string_literal: true

Rails.application.routes.draw do
  
  root 'home#index'

  get 'login' => 'user_sessions#new', :as => :login
  get 'register' => 'user_registrations#new', :as => :new
  post 'register' => 'user_registrations#create'
  post 'login' => 'user_sessions#create'
  delete 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users do
    put 'toggle_active' => 'users#toggle_active'
    put 'update_role' => 'users#update_role', on: :member
  end

  resources :students do
    put 'asist', to: 'asists#update'
    get 'delete_modal', to: 'students#delete_modal'
    resources :comments, only: [:create] do
      resources :answers, only: [:create]
      post 'toggle_like' => 'likes#toggle_like'
    end
  end


  resources :posts, only: [:create] do
    post 'answer' => 'answers#create_post_answer'
    post 'toggle_like' => 'likes#toggle_post_like'
  end

  get 'home', to: 'home#index'
end
