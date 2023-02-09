require 'csv'
class DownloadController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :require_user, only: [:download_csv]

  def download_csv
    csv = generate_csv
    data = CSV.open("emprestimos_#{current_user.name}.csv".downcase, "w") do |d|
      csv.each { |row| d << row }
    end
    texto = ""
    data.each do |e|
      texto << e.join(" ") << "\n"
    end

    send_data(texto)
    # flash[:csv_download_success] = "Aquivo CSV foi salvo com sucesso!"
  end

  def dowload_pdf
    emprestimos = current_user.emprestimos
    pdf = Prawn::Document.new
    emprestimos.each do |e|
      carro = Carro.find(e.carro_id)
      pdf.text "Meus Emprestimos", :align => :center, :size => 24, :styles => [:bold]
      pdf.move_down 5
      pdf.text "<b>Modelo:</b> #{carro.modelo}", :inline_format => true
      pdf.text "<b>Marca:</b> #{carro.marca}", :inline_format => true
      pdf.text "<b>Placa:</b> #{carro.placa}", :inline_format => true
      pdf.text "<b>Data inicial:</b> #{e.data_inicial.strftime('%m/%d/%Y')}", :inline_format => true
      pdf.text "<b>Data final:</b> #{e.data_final.strftime('%m/%d/%Y')}", :inline_format => true
      pdf.text "<b>Valor do emprestimo:</b> #{number_to_currency(e.valor, locale: :"pt-BR")}", :inline_format => true
      pdf.move_down 20
    end
    send_data(pdf.render,
              filename: "emprestimos_#{current_user.name}.pdf",
              type: "application/pdf")
  end

  private

  def generate_csv
    emprestimos = current_user.emprestimos
    data = [%w[MODELO MARCA PLACA DATA_DE_RETIRADA DATA_DE_ENTREGA VALOR_FINAL]]
    emprestimos.each do |e|
      carro = Carro.find(e.carro_id)
      data << [carro.modelo, carro.marca, carro.placa, e.data_inicial, e.data_final, e.valor]
    end
    data
  end

  def require_user
    unless current_user
      redirect_to new_user_session_path
    end
  end
end
