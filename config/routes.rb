  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'recipes#index', as: :authenticated_root
  end

  root to: 'pages#home'

  resources :profiles, only: [:show]
  resources :recipes do
    resources :amounts, only: [:new, :create, :destroy]
    resources :recipe_equipments, only: [:new, :create]
    resources :favourites, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
