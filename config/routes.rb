Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users do
    member do
     resources :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end
  #, only: [:show,:index,:edit,:update]
  resources :books do
    resources :comments, only: [:create, :destory]
    resource :favorites, only: [:create, :destroy]
  end
end