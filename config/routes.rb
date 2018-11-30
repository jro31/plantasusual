  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profiles
  resources :recipes do
    resources :recipe_equipments, :amounts, :recipe_categories
  end
end
