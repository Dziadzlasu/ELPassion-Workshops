Rails.application.routes.draw do
  devise_for :users
  root 'main#index'
  get '/contact', to: 'contact#index'
  resources :movies
  resources :users, only: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
