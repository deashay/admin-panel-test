Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  resources :posts do
    resources :comments, controller: 'posts/comments', only: [:create, :destroy]
  end
end
