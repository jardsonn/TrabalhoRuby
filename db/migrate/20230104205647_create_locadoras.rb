class CreateLocadoras < ActiveRecord::Migration[7.0]
  def change
    create_table :locadoras do |t|
      t.references :carro, null: false, foreign_key: true
      t.string :Carro
      t.references :locatario, null: false, foreign_key: true
      t.string :Locatario

      t.timestamps
    end
  end
end
