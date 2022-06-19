Rails.application.routes.draw do
  get 'checklist_items/index'
  get 'tasks/index'
  devise_for :users
  root to: 'pages#home'
  resources :movies, only: %i[index create]
  resources :posts do
    resources :qr_codes, only: :create
  end

  resources :tasks, only: %i[index show] do
    namespace :assignments do
      resources :multiples, only: :create
    end
    resources :assignments, only: :create
    resources :checklist_items, only: [:index]
  end
  resources :checklist_items, only: :update
end
