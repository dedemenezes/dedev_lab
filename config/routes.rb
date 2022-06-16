Rails.application.routes.draw do
  get 'tasks/index'
  devise_for :users
  root to: 'pages#home'
  resources :movies, only: %i[index create]
  resources :posts do
    resources :qr_codes, only: :create
  end

  resources :tasks, only: :index do
    resources :assignments, only: :create
  end
end
