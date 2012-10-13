DataEngineering::Application.routes.draw do
  resources :customers, only: [:index]
  resources :merchants, only: [:index]
  resources :products, only: [:index]
  resources :orders, only: [:index, :show]

  get "importer", to: "importer#index"
  post "importer", to: "importer#upload"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'welcome#index'
end