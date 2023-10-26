class CreateTasks < ActiveRecord::Migration[7.1]
  def up
    create_table :tasks do |t|
      #pk id auto-generated
      #t.foreign_key :creator_id #TODO future iteration - uid of creator in user db

      t.string :title,          default: "New Task"
      t.string :description
      t.boolean :is_duration,   default: false
      t.integer :duration,      default: 1            #task duration in minutes

      t.boolean :is_recurring,  default: false
      t.string :recurrence

      t.boolean :is_reminder,   default: false
      t.datetime :next_reminder

      t.boolean :is_relative_start, default: false    #true if task start is based off of another task

      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
