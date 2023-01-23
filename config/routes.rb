Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }

  root "main#index"
  resources :carros
  resources :emprestimos
  resources :emprestimos, only: [:show]

  get "user/profile/reservas", to: "user#reservas"
  get "user/profile/nova_reserva", to: "user#nova_reserva"
  get "user/profile/informacao", to: "user#informacao"
  get "user/profile/lista_cliente", to: "user#lista_cliente"
  get "user/profile/lista_carro", to: "user#lista_carro"


  get "download_csv", to: "download#download_csv"

  get "download_pdf", to: "download#dowload_pdf"

  get '/test', to: 'test#index'

  # get 'shared/carros_grid', to: 'shared#carros_grid'

  # get 'shared/:name/', to: 'shared#show', as: 'shared'
  # get 'shared/:name/:emprestimos', to: 'shared#show', as: 'shared'

  # get 'shared/:name/:emprestimos', to: 'shared#show', as: 'shared', emprestimos: []
  # get 'shared/:name', to: 'shared#show', as: 'shared', emprestimos: []



  # authenticated :user do
  #
  #   puts "Está autenticado ooooooi #{user_signed_in?}"
  #   # root :to => "users#show", as: 'user_root'
  # end

end


