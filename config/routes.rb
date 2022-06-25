Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :posts do
    resources :comments
  end

  get 'posts/view/:id', to: 'posts#ditum', as: 'ditum'

  namespace :admin do
    root 'home#index'
    resources :posts
  end
end
