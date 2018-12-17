  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'recipes#index', as: :authenticated_root
  end

  root to: 'pages#home'

  get 'pages/admin_panel', to: 'pages#admin_panel'

  resources :profiles, only: [:show]
  resources :recipes do
    resources :amounts, only: [:new, :create, :destroy]
    resources :favourites, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update] do
      resources :comment_reports, only: [:new, :create]
    end
    patch 'comments/:id/mark_as_deleted', to: 'comments#mark_as_deleted', as: :mark_comment_as_deleted
    resources :recipe_reports, only: [:new, :create]
    resources :recipe_relates, only: [:new, :create, :destroy]
  end
  patch 'recipes/:id/mark_as_deleted', to: 'recipes#mark_as_deleted', as: :mark_recipe_as_deleted

  resources :comment_reports, only: [:index, :update]
  resources :recipe_reports, only: [:index, :update]
end
