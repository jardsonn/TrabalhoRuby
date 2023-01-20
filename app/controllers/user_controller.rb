class UserController < ApplicationController
  # before_action :require_user, only: [:reservas]
  before_action :authenticate_user!, only: [:reservas]

  def reservas
    @emprestimos = current_user.emprestimos
  end

  def nova_reserva
    # @emprestimos = Emprestimo.find_by_user_id(current_user.id)
    @emprestimos = current_user.emprestimos
    @carros = Carro.all()
  end

  def informacao
    # @emprestimos = Emprestimo.find_by_user_id(current_user.id)
    @emprestimos = current_user.emprestimos
    @carros = Carro.all()
  end


  # private
  # def require_user
  #   unless current_user
  #     redirect_to new_user_session_path
  #   end
  # end
end
