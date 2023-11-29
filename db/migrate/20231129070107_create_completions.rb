class CreateCompletions < ActiveRecord::Migration[7.1]
  def up
    create_table :completions do |t|
      t.references  :users, null: false, foreign_key: true
      t.references  :routines, null: false, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :completions do |t|
      t.remove_references  :users, null: false, foreign_key: true
      t.remove_references  :routines, null: false, foreign_key: true
    end
  end
end
