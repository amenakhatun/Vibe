Rails.application.routes.draw do

  root 'home#index'


  resources :sessions, only: [:new, :create, :destroy]

  resources :users

  resources :home

  resources :home, only: [:index]

  resources :events, only: [:new, :create, :show, :edit, :destroy]

  resources :organizations, only: [:index, :new, :create]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
