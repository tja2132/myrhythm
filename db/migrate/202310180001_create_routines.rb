class CreateRoutines < ActiveRecord::Migration[7.1]
  def up
    create_table :routines do |t|
      #pk id auto-generated
      #t.foreign_key :creator_id #TODO future iteration - uid of creator in user db

      t.string :title,              default: "New Routine"
      t.string :description

      #JSON.stringify of task hash containing ids of tasks in task table
      t.string :tasks

      t.boolean :is_recurring,      default: false
      t.string :recurrence

      t.boolean :is_reminder,       default: false
      t.datetime :next_reminder

      t.datetime :next_occurrence,  default: Time
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end

  def down
    drop_table :routines
  end
end
