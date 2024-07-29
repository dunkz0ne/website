Rails.application.routes.draw do

  resources :users
  resources :teams
  resources :players
  resources :matches
  resources :league

  resources :journalists

  resources :articles do
    member do
      get 'save'
      get 'unsave'
    end
  end

  resources :drafts 

  resources :releases


  get 'become_journalist', to: 'users#become_journalist'

  get '/user/dashboard/' => 'dashboard#index'

  get '/auth/facebook/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'

  root 'home#index'

end
