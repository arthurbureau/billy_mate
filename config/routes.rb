Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'
  get '/my_profile', to: 'profiles#show', as: :profile
  get '/my_flat', to: 'profiles#my_flat', as: :my_flat
  get '/categories', to: 'flats#categories', as: :categories

  resources :flats, only: [:new, :create, :edit, :update, :destroy]
  resources :bills, only: [:index, :new, :create, :edit, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
