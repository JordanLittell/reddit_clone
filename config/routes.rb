Rails.application.routes.draw do
  resources :users, only: [:create, :new, :show]
  resources :subs, except: [:destroy]
  resource :session, only: [:new, :create, :destroy]
end
