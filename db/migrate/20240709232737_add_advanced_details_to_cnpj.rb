class AddAdvancedDetailsToCnpj < ActiveRecord::Migration[7.1]
  def change
    add_column :cnpjs, :website, :string
    add_column :cnpjs, :linkedin, :string
    add_column :cnpjs, :google_maps_phone, :string
  end
end
