Rails.application.routes.draw do
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
    resources :notes, only: :create
  end
  resources :notes, only: :index
  resources :checklist_items, only: :update
end
