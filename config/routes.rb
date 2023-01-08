Rails.application.routes.draw do
  root "main#index"

  # post '/sessions' => 'sessions#create'
  # post '/locatarios' => 'locatario#create'
  get '/dashboard' => 'sessions#index'

 resources :carros
end
