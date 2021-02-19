Rails.application.routes.draw do
  devise_for :users
  root to: 'subjects#index'
  resources :subjects, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  post '/subjects/:id/vote1', to: 'subjects#vote1'
  post '/subjects/:id/vote2', to: 'subjects#vote2'
  post '/subjects/:id/vote3', to: 'subjects#vote3'
end
