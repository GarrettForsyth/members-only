Rails.application.routes.draw do

  root 'static_pages#club_house'

  resources :users
  resources :posts, only: [:new, :create, :index]
  resources :sessions, only: [:new, :create, :destroy]

  get    '/sign_in',  to: 'sessions#new'
  post   '/sign_in',  to: 'sessions#create'
  delete '/sign_out', to: 'sessions#destroy'

end
