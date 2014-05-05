BackEndChallenge002::Application.routes.draw do
  #I use singular for game controller because there is no need for using plural in this case
  resources :game
  root :to => 'game#new'
end
