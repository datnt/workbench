RoomoramaDevtest::Application.routes.draw do
  get "/list" => "shortener/shortened_urls#list"
  get "/" => "shortener/shortened_urls#new"
  root :to => 'shortener/shortened_urls#new'
  
  namespace :shortener do
    resources :shortened_urls do
      collection do
        get :list
      end
    end
  end
  
  resources :link_gas do
  end
  resources :demos do
  end
  namespace :api do
    namespace :v1 do
      resources :shortened_urls do
        collection do
          get :stats
        end
      end
    end
  end
  get "/:id" => "shortener/shortened_urls#show"

end
