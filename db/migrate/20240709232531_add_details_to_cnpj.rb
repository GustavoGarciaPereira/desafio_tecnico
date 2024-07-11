class AddDetailsToCnpj < ActiveRecord::Migration[7.1]
  def change
    add_column :cnpjs, :name, :string
    add_column :cnpjs, :address, :string
    add_column :cnpjs, :phone, :string
  end
end
