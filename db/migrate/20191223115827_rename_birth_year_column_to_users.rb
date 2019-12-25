class RenameBirthYearColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :birth_year, :birthyear_id
  end
end
