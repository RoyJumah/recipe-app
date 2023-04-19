Rails.application.routes.draw do
  devise_for :users
  # get 'recipes/', to: 'recipes#index'
  # get 'recipes/:id', to: 'recipes#show'
  # get'recipes/new', to: 'recipes#new'
  # delete 'recipes/:id', to: 'recipes#destroy'

  root "foods#index"

  resources :foods ,only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show]
end
