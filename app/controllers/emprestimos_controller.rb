class EmprestimosController < ApplicationController
  before_action :set_carro, only: %i[ show ]
  before_action :require_user, only: [:show]

  def show
    @emprestimo = Emprestimo.new
  end

  def create
    @emprestimo = Emprestimo.new(emprestimo_params)

    respond_to do |format|
      if @emprestimo.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @emprestimo }
      else
        redirect_to root_path
      end
    end
  end

  def set_carro
    @carro = Carro.find(params[:id])
  end

  def emprestimo_params
    params.require(:emprestimo).permit(:user_id, :data_inicial, :data_final, :valor, :carro_id)
  end


  def calular_valor(valor_final, valor_inicial, valor)
    diff_in_time = (valor_final - valor_inicial)
    diff_in_days = diff_in_time / (1000 * 3600 * 24)
    (diff_in_days * valor)
  end

  private

  def require_user
    unless current_user
      redirect_to new_user_session_path
    end
  end
end