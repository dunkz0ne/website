Rails.application.routes.draw do

  #devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users
  resources :teams
  resources :players
  resources :matches
  resources :league
  resources :journalists
  resources :team_managers
  resources :admin

  resources :articles do
    resources :comments, only: [:create] do
      member do
        get 'like'
        get 'unlike'
        get 'delete'
        get 'save'
        get 'unsave'
      end
    end
    member do
      get 'save'
      get 'unsave'
      get 'delete'
    end
  end

  resources :releases do
    member do
      get 'delete'
    end
  end

  resources :journalist_requests, only: [:new, :create, :index] do
    member do
      get 'approve'
      get 'reject'
    end
  end

  resources :users do
    member do
      get :increment_strikes
      get :decrement_strikes
      post :delete
      post :ban_users
      get :unban
      post :delete_articles
      get 'admin_dashboard'
    end
  end

  match "/404", to: redirect('/404.html'), via: :all
  match "/500", to: redirect('/500.html'), via: :all

  get 'become_journalist', to: 'users#become_journalist'
  get 'become_team_manager', to: 'users#become_team_manager'
  get 'become_admin', to: 'users#become_admin'

  get '/user/dashboard/' => 'dashboard#index'

  get '/auth/facebook/callback' => 'session#create'
  get '/auth/failure' => 'session#fail'
  get '/session/destroy' => 'session#destroy'

  get 'session/new'
  post 'session/create', to: 'session#create'

  root 'home#index'

end
