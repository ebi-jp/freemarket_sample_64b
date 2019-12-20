class RenameSendDayColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :send_day, :days_id
  end
end
