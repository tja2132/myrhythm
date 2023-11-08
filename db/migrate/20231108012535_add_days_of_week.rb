class AddDaysOfWeek < ActiveRecord::Migration[7.1]
def change
  add_column :routines, :mon, :boolean
  add_column :routines, :tue, :boolean
  add_column :routines, :wed, :boolean
  add_column :routines, :thu, :boolean
  add_column :routines, :fri, :boolean
  add_column :routines, :sat, :boolean
  add_column :routines, :sun, :boolean
end
end