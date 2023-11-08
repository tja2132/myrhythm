class RemoveEndTime < ActiveRecord::Migration[7.1]
  def change
    remove_column :routines, :end_time
  end
end
