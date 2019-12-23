class RenameBirthDayColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :birth_day, :birthday_id
  end
end
