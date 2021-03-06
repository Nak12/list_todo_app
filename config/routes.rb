Rails.application.routes.draw do
  devise_for :users
  #get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  resources :lists do
    resources :tasks
  end 

  resources :favorites, except: [:edit, :update, :destroy, :show]
  
end
