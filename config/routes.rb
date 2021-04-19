Rails.application.routes.draw do

  get 'users/show'
  root to: 'homes#top'
  root to: 'users#show'
  root to: 'homes#about'
  devise_for :users
  get 'books/:id' => 'books#show', as: 'book'

  resources :books, only: [:new, :create, :index, :show, :destroy, :update, :edit]

  resources :users, only: [:show, :edit, :update, :create, :index]



  get 'home/about', to: 'homes#about'

end
