class AddIsPublicToRoutines < ActiveRecord::Migration[7.1]
    def change
      add_column :routines, :is_public, :boolean
    end
  end