class AddImagemUrlToCarros < ActiveRecord::Migration[7.0]
  def change
    add_column :carros, :imagemUrl, :string
  end
end
