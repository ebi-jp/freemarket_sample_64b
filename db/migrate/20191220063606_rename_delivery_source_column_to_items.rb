class RenameDeliverySourceColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :delivery_source, :prefecture_id
  end
end
