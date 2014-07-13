Personal::Application.routes.draw do
root to: 'posts#index'
resources :posts
resources :users
resources :categories

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
