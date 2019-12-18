class RenameNameColumnToImages < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :name, :image
  end
end
