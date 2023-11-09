class RemoveDaysofweekRecurrence < ActiveRecord::Migration[7.1]
  def change
    remove_column :routines, :recurrence
    remove_column :routines, :daysofweek
  end
end
