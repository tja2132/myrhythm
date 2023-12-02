class AddDeletedOnColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :deleted_on, :datetime
  end
end
