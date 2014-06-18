Rails.application.routes.draw do
  resources :products do
    collection do
      get :images
    end
  end
end
