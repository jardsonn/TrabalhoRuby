class CreateLocatarios < ActiveRecord::Migration[7.0]
  def change
    create_table :locatarios do |t|
      t.string :nome
      t.datetime :idade
      t.string :telefone
      t.references :emprestimo, null: false, foreign_key: true
      t.string :Emprestimo

      t.timestamps
    end
  end
end
