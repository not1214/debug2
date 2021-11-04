Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  
  resources :books do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  get 'home/about' => 'homes#about'

  get "/search" => "searchs#search"

end
