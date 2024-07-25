Rails.application.routes.draw do
  root 'home#index'
  get '/dashboard/' => 'dashboard#index'

  resources :users
  resources :teams
  resources :players
  resources :matches

  get '/auth/facebook/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'

end
