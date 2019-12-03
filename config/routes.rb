# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get '/test' => 'notes#test'
  get '/search' => 'notes#search', :as => 'search_note'
  get '/notes/hashtag/:keyword', to:'notes#hashtags'
  get 'notes/tags'
  resources :tags
  devise_for :users
  resources :categories do
   resources :notes
  end
  mount Sidekiq::Web => '/sidekiq' # monitoring console

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
