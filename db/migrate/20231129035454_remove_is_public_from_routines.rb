class RemoveIsPublicFromRoutines < ActiveRecord::Migration[7.1]
  def change
    remove_column :routines, :isPublic, :boolean
  end
end
