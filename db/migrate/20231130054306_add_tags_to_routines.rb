class AddTagsToRoutines < ActiveRecord::Migration[7.1]
  def change
    add_column :routines, :home, :boolean, default: false, null: false
    add_column :routines, :work, :boolean, default: false, null: false
    add_column :routines, :school, :boolean, default: false, null: false
  end
end
