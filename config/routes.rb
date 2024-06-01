Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :teams
  resources :players
  root 'home#index'

  get '/auth/facebook/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
