class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      # t.string :post_code,              null: false
      # t.integer :prefecture_id, null: false 
      # t.string :municipality,          null: false
      # t.string :address,              null: false
      # t.string :building_name             
      # t.string :telephone_number,        null: false
      # t.references :purchase,            foreign_key: true, null: false

      t.timestamps
    end
  end
end
