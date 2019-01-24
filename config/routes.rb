Rails.application.routes.draw do
  root 'welcome#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  resources :users, only: [:create, :show]
  resources :cart, only: [:show]
  resources :order_items
  resources :items
  resources :items, only: [:show] do
    post '/purchase' => 'transactions#create'
    resources :reviews
  end
end
