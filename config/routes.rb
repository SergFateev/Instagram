Rails.application.routes.draw do
  devise_for :users
  get 'home/index'

  root to: 'home#index'

  resources :users, only: [:show, :edit, :update] do
    resources :followers, only: :index
    resources :followings, only: :index
  end

  resources :follows, only: [:create]
    
  resources :posts, only: [:new, :create,
                           :show, :update, :destroy] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
