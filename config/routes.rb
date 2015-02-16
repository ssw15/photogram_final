Rails.application.routes.draw do

  resources :followings

  resources :favoritings

  resources :comments

  get 'my_photos' => 'photos#my_photos', :as => 'my_photos'
  get 'my_favorites' => 'photos#my_favorites', :as => 'my_favorites'
  get 'my_timeline' => 'photos#my_timeline', :as => 'my_timeline'

  resources :photos

  devise_for :users

  root "photos#index"

  resources :users, :only => [:show]

end
