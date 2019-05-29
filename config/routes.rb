Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/my_profile', to: 'profiles#my_profile', as: :profile
  get '/join_flat', to: 'profiles#join_flat', as: :join_flat
  get '/categories', to: 'bills#display_categories', as: :categories

  resources :flats, only: [:new, :show, :create, :edit, :update, :destroy] do
    resources :users, only: [:update]
  end
  resources :bills, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :transactions, only: [:create]
  end






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
