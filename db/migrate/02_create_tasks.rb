class CreateTasks < ActiveRecord::Migration[7.1]
  def up
    create_table :tasks do |t|
      t.references :routine, null: false, foreign_key: true
      t.integer :sequence #tentative solution to task ordering
      t.string :title
      t.string :description
      t.integer :duration, default: 0
      #TODO reletive start, etc
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
