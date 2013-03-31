Blog::Application.routes.draw do
  mount Doorkeeper::Engine => '/oauth'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :articles
      match 'user', to: 'users#show'
    end
  end


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  root to: 'articles#index'
  resources :articles  do
    collection do
      post :comment
    end
  end
end
