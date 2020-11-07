Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
    resources :comments, only: [:create, :destory]
    resource :favorites, only: [:create, :destroy]
  end
end