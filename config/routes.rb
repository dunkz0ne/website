Rails.application.routes.draw do

  resources :users
  resources :teams
  resources :players
  resources :matches
  resources :league

  resources :journalists
  resources :admin

  resources :articles do
    resources :comments, only: [:create] do
      member do
        get 'delete'
      end
    end
    member do
      get 'save'
      get 'unsave'
      get 'delete'
    end
  end

  resources :releases

  resources :journalist_requests, only: [:new, :create, :index] do
    member do
      post 'approve'
      delete 'reject'
    end
  end

  get 'become_journalist', to: 'users#become_journalist'
  get 'become_team_manager', to: 'users#become_team_manager'
  get 'become_admin', to: 'users#become_admin'

  get '/user/dashboard/' => 'dashboard#index'

  get '/auth/facebook/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'

  root 'home#index'

end
