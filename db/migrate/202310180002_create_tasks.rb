class CreateTasks < ActiveRecord::Migration[7.1]
  def up
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      # todo: recurrence, etc
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
