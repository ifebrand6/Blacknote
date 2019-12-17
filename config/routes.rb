# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get '/test' => 'notes#test'
  get '/search' => 'notes#search', :as => 'search_note'
  get '/notes/hashtag/:keyword', to: 'notes#hashtags'
  get 'notes/tags'
  get '/trash' => 'notes#trash', :as => 'trash'
  get 'state/:id' => 'notes#state', :as => 'state'
  resources :tags
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :categories do
    resources :notes
  end
  mount Sidekiq::Web => '/sidekiq' # monitoring console

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
