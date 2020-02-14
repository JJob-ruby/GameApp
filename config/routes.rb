Rails.application.routes.draw do
  
  root 'games#index'

  resources :scores
  resources :games
  resources :matches

  devise_for :users

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
