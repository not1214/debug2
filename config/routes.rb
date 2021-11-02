Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
    resources :favorites, only: [:create, :destroy]
  end
  
  
  get 'home/about' => 'homes#about'

end
