class AddUserSettings < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :default_calendar, :string
    add_column :users, :default_insights, :string
    # add_column :users, :first_day_of_week, :string
  end
end
