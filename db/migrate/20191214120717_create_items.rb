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
      t.references :seller,      null: false
      t.references :buyer,       null: false
      t.references :category,    null: false
      t.references :brand,       null: false
      t.timestamps
    end
    add_foreign_key :items, :users, column: :seller_id
    add_foreign_key :items, :users, column: :buyer_id
    add_foreign_key :items, :categories, column: :category_id
    add_foreign_key :items, :brands, column: :brand_id
  end
end
