class RenameSendBurdenColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :send_burden, :hutan_id
  end
end
