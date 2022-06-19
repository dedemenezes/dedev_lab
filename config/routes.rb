Rails.application.routes.draw do
  get 'tasks/index'
  devise_for :users
  root to: 'pages#home'
  resources :movies, only: %i[index create]
  resources :posts do
    resources :qr_codes, only: :create
  end

  resources :tasks, only: %i[index show] do
    resources :assignments, only: :create
    resources :checklist_items, only: :index
  end
end
