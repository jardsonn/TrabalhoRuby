Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }



  root "main#index"
  resources :carros
  resources :emprestimos
  resources :emprestimos, only: [:show]
  get "user/profile", to: "user#index"
  # authenticated :user do
  #
  #   puts "Está autenticado ooooooi #{user_signed_in?}"
  #   # root :to => "users#show", as: 'user_root'
  # end

end
