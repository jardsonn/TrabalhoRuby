class CreateEmprestimos < ActiveRecord::Migration[7.0]
  def change
    create_table :emprestimos do |t|
      t.datetime :tempo_inicial
      t.datetime :tempo_final
      t.references :carro, null: false, foreign_key: true
      t.string :Carro

      t.timestamps
    end
  end
end
