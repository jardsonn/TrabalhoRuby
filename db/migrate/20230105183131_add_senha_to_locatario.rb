class AddSenhaToLocatario < ActiveRecord::Migration[7.0]
  def change
    add_column :locatarios, :senha, :string
  end
end
