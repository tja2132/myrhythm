class RemoveStartEndDate < ActiveRecord::Migration[7.1]
  def change
    remove_column :routines, :start_date
    remove_column :routines, :end_date
    add_column :routines, :start_day, :string
  end
end
