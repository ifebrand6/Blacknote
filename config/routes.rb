# frozen_string_literal: true

Rails.application.routes.draw do
  get '/test' => 'notes#test'
  get '/search' => 'notes#search', :as => 'search_note'
  resources :tags
  resources :categories
  devise_for :users
  resources :notes
  get '/notes/hashtag/:keyword', to:'notes#hashtags'
  mount Sidekiq::Web => '/sidekiq' # monitoring console
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
