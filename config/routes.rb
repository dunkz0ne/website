Rails.application.routes.draw do

  resources :users
  resources :teams
  resources :players
  resources :matches

  resources :journalists
  resources :articles
  resources :releases

  get '/user/dashboard/' => 'dashboard#index'

  get '/auth/facebook/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'

  root 'home#index'

end
