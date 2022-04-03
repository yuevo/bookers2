Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  get 'chats/show'
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users
  root to: 'home#top'
  get '/home/about', to: 'home#about'
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books do 
    resource :favorites, only: [:create, :destroy]
  end
  resources :chats, only: [:show, :create]
end
