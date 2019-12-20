class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :item
      t.string :price
      t.string :size
      t.string :status
      t.string :send_burden
      t.string :send_plan
      t.string :delivery_source
      t.string :send_day
      t.text :description
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :category_id
      t.integer :brand_id
    end
  end
end
