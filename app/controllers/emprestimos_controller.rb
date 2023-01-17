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
        format.html { redirect_to root_path, notice: "Carro alugado com sucesso!" }
        format.json { render :show, status: :created, location: @emprestimo }
      else
        redirect_to root_path
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @emprestimo.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_carro
    @carro = Carro.find(params[:id])
  end

  def emprestimo_params
    params.require(:emprestimo).permit(:user_id, :data_inicial, :data_final, :valor)
  end


  private

  def require_user
    unless current_user
      redirect_to new_user_session_path
    end
  end
end