Apidemo::Application.routes.draw do
  root to: 'homes#login'
  resources :homes do
    collection do
      get :login
      post :authentication
    end
  end

end
