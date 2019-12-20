class RenameCategoryIdColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :category_id, :parent_id
  end
end
