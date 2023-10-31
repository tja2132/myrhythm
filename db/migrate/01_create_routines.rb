class CreateRoutines < ActiveRecord::Migration[7.1]
  def up
    create_table :routines do |t|
      t.string :title, default: "New Routine"
      t.text :description
      t.string :recurrence, default: "None"
      t.date :start_date, default: Time.now     #for recurrence
      t.boolean :is_end_date
      t.date :end_date                          #for recurrence
      t.time :start_time, default: Time.now     #for reminders
      t.time :end_time                          #for reminders

      t.timestamps
    end
  end

  def down
    drop_table :routines
  end
end
