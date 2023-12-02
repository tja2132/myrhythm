class AddRecurrence < ActiveRecord::Migration[7.1]
  def change
    add_column :routines, :recurrence, :string
    add_column :tasks, :url, :string
    add_column :routines, :active, :boolean, default: true
  end
end
