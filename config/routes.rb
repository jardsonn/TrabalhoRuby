Rails.application.routes.draw do
  root "main#index"

  # post '/sessions' => 'sessions#create'
  # post '/locatarios' => 'locatario#create'
  get '/dashboard' => 'sessions#index'
  get '/test', to: 'test#index'

 resources :carros
end
