class CreateCompletions < ActiveRecord::Migration[7.1]
  def up
    create_table :completions do |t|
      t.references  :routine, null: false, foreign_key: true
      t.timestamps
    end
  end

  def down
    drop_table :completions do |t|
      t.remove_references  :routine, null: false, foreign_key: true
    end
  end
end
