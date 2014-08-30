Rails.application.routes.draw do
  
  resources :posts, except: [:index]
  resources :users, only: [:create, :new, :show]
  resources :subs, except: [:destroy]
  resource :session, only: [:new, :create, :destroy]
end
