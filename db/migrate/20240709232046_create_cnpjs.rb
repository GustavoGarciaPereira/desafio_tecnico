class CreateCnpjs < ActiveRecord::Migration[7.1]
  def change
    create_table :cnpjs do |t|
      t.string :value

      t.timestamps
    end
  end
end
