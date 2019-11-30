# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tags
  resources :categories
  devise_for :users
  resources :notes
  mount Sidekiq::Web => '/sidekiq' # monitoring console
  root 'notes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
