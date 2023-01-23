class CarrosController < ApplicationController
  before_action :set_carro, only: %i[ show edit update destroy ]
  # before_action :require_user, only: [:show]
  before_action :only_admin, only: [:new, :edit, :create]

  # GET /carros or /carros.json
  def index
    @carros = Carro.order(:marca).page(params[:page])
  end

  # GET /carros/1 or /carros/1.json
  def show
    @emprestimo = Emprestimo.new
    @emprestimo.user_id = session[:user_id]
  end

  # GET /carros/new
  def new
    @carro = Carro.new
  end

  # GET /carros/1/edit
  def edit
  end

  # POST /carros or /carros.json
  def create
    @carro = Carro.new(carro_params)

    respond_to do |format|
      if @carro.save
        format.html { redirect_to emprestimo_path(@carro), notice: "Carro criado com sucesso." }
        format.json { render :show, status: :created, location: @carro }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carros/1 or /carros/1.json
  def update
    respond_to do |format|
      if @carro.update(carro_params)
        format.html { redirect_to emprestimos_path, notice: "Carro was successfully updated." }
        format.json { render :show, status: :ok, location: @carro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carros/1 or /carros/1.json
  def destroy
    @carro.destroy

    respond_to do |format|
      format.html { redirect_to carros_url, notice: "Carro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_carro
    @carro = Carro.find(params[:id])
  end

   def only_admin
     if current_user
       puts "Está aqui #{current_user.admin}"
       unless current_user.admin
         redirect_to root_path, non_admin: "Você não é administrador."
       end
     else
       redirect_to new_user_session_path, not_logged_in: "Necessário está logado."
     end
  end



  # Only allow a list of trusted parameters through.
  def carro_params
    params.require(:carro).permit(:modelo, :marca, :valor_aluguel, :placa, :imagemUrl)
  end

  def emprestimo_params
    params.require(:emprestimo).permit(:user_id, :data_inicial, :data_final, :valor)
  end
end
