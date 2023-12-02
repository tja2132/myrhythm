class RemoveRecurrence < ActiveRecord::Migration[7.1]
  def change
    remove_column :routines, :recurrence
    remove_column :routines, :active
  end
end
