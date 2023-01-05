class AddEmailToLocatario < ActiveRecord::Migration[7.0]
  def change
    add_column :locatarios, :email, :string
  end
end
