Rails.application.routes.draw do
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

end


