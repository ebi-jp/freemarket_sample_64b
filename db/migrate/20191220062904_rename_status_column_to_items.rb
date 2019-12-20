class RenameStatusColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :status, :condition_id
  end
end
