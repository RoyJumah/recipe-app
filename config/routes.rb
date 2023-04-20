Rails.application.routes.draw do
  devise_for :users
  # get 'recipes/', to: 'recipes#index'
  # get 'recipes/:id', to: 'recipes#show'
  # get'recipes/new', to: 'recipes#new'
  # delete 'recipes/:id', to: 'recipes#destroy'

  root "foods#index"

  resources :foods ,only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show, :recipe_foods] do
    resources :recipe_foods, only: [:new ,:create, :destroy]
  end
  resources :public_recipes, only: [:index]
end
