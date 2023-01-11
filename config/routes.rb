Rails.application.routes.draw do
  devise_for :users
  root "main#index"


 
  
  get '/test', to: 'test#index'


 resources :carros
end
