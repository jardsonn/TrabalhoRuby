class AddCarroIdToEmprestimo < ActiveRecord::Migration[7.0]
  def change
    add_column :emprestimos, :carro_id, :integer
  end
end
