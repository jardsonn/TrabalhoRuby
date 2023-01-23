class UserController < ApplicationController
 
  before_action :authenticate_user!, only: [:reservas]

  def reservas
    @emprestimos = current_user.emprestimos
  end

  def nova_reserva
   
    @emprestimos = current_user.emprestimos
    @carros = Carro.all()
  end

  def informacao
    
    @emprestimos = current_user.emprestimos
    @carros = Carro.all()
  end

  def lista_cliente
    @clientes = User.all().select{|cliente| !cliente.admin}
  end

  def lista_carro
    @carros = Carro.all()
  end


  
end
