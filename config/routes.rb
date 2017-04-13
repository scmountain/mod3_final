Rails.application.routes.draw do
  root 'stores#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  post '/api/v1/items/new', to: 'api/v1/items#new'
  namespace :api do
    namespace :v1 do
      resources :items
    end
  end
end
