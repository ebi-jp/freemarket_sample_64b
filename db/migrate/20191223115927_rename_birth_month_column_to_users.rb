class RenameBirthMonthColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :birth_month, :birthmonth_id
  end
end
