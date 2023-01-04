class CreateCarros < ActiveRecord::Migration[7.0]
  def change
    create_table :carros do |t|
      t.string :modelo
      t.string :marca
      t.float :valor_aluguel
      t.string :placa

      t.timestamps
    end
  end
end
