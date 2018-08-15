Rails.application.routes.draw do
  devise_for :users
  root :to => 'posts#index'
  resources :posts

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
