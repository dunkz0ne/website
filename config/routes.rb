Rails.application.routes.draw do
  resources :users
  resources :teams
  resources :players
  root 'home#index'

  get '/auth/facebook/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'

end
