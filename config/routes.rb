  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles, only: [:show]
  resources :recipes do
    resources :recipe_categories, only: [:new, :create]
    resources :amounts, only: [:new, :create]
    resources :recipe_equipments, only: [:new, :create]
    resources :favourites, only: [:create, :destroy]
  end
end
