Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: 'furimas#index'
  resources :furimas, only: [:new, :create, :show, :edit, :update, :destroy ]
  
  namespace :admin do
    root to: 'articles#index'
    resources :articles
  end

  
end  
