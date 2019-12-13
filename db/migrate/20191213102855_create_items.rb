class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.string :price,           null: false
      t.string :size
      t.string :status,          null: false
      t.string :send_burden,     null: false
      t.string :send_plan,       null: false
      t.string :delivery_source, null: false
      t.string :send_day,        null: false
      t.text :description,       null: false
      t.integer :seller_id,      null: false, foreign_key: true
      t.integer :buyer_id,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
