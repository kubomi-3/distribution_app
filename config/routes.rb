Rails.application.routes.draw do
  devise_for :users
  root to: 'subjects#index'
  resources :subjects, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    member do
      post 'vote1'
      post 'vote2'
      post 'vote3'
    end
  end
  resources :users, only: :show
end
