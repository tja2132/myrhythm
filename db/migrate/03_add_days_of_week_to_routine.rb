class AddDaysOfWeekToRoutine < ActiveRecord::Migration[7.1]
  def change
    add_column :routines, :daysofweek, :string
  end
end
