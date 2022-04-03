Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get '/home/about', to: 'home#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books do 
    resource :favorites, only: [:create, :destroy]
  end
end
