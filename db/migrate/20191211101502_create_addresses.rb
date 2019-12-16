class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      # t.references :user_id, foreign_key: true
      t.string :postal_code
      t.integer :prefecture_id
      t.string :city
      t.string :address
      t.string :building
      t.integer :phone_number

      t.timestamps
    end
  end
end
