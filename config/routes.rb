Rails.application.routes.draw do
  root to: 'furimas#index'
  resources :furimas, only: [:new, :create, :show, :edit, :update, :destroy ]


end  
