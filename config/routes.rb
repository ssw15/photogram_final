Rails.application.routes.draw do

  resources :followings

  resources :favoritings

  resources :comments

  resources :photos

  devise_for :users
  root "photos#index"

end
