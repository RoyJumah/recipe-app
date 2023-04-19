Rails.application.routes.draw do
  # get 'recipes/', to: 'recipes#index'
  # get 'recipes/:id', to: 'recipes#show'
  # get'recipes/new', to: 'recipes#new'
  # delete 'recipes/:id', to: 'recipes#destroy'

  root "foods#index"

  resources :foods ,only: [:index, :new, :create, :destroy]
  resources :publicrecipes, only: [:index]
  resources :recipes, only: [:index, :new, :create, :destroy, :show]
end
