Rails.application.routes.draw do

  get 'users/show'
  root to: 'homes#top'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :destroy] do

  resources :users, only: [:show, :edit, :update, :create]



  get 'home/about'

end
