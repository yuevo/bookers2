Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get '/home/about', to: 'home#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books
end
