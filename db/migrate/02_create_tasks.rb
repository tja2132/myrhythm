class CreateTasks < ActiveRecord::Migration[7.1]
  def up
    create_table :tasks do |t|
      t.references :routine, null: false, foreign_key: true
      t.integer :sequence
      t.string :title, default: "New Task"
      t.string :description
      t.integer :duration, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
