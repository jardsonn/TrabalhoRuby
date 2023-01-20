class SharedController < ApplicationController
  # def carros_grid
  #   render 'shared/_carros_grid'
  # end
  def show
    @name = params[:name]
    @emprestimos = Emprestimo.find(params[:emprestimos].split(','))
    respond_to do |format|
      format.html { render partial: "shared/#{@name}"}
    end
  end


end
