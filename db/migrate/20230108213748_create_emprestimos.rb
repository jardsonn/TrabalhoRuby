class CreateEmprestimos < ActiveRecord::Migration[7.0]
  def change
    create_table :emprestimos do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :data_inicial
      t.datetime :data_final
      t.float :valor

      t.timestamps
    end
  end
end
