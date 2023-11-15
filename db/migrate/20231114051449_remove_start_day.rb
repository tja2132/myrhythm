class RemoveStartDay < ActiveRecord::Migration[7.1]
  def change
    remove_column :routines, :start_day
  end
end
