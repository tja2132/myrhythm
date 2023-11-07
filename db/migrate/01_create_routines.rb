class CreateRoutines < ActiveRecord::Migration[7.1]
  def up
    create_table :routines do |t|
      t.string :title, default: "New Routine"
      t.text :description

      t.string :recurrence, default: "None"   #based on checkbox selections (all vs some)
      t.string :daysofweek, default: ""       #constructed from daily booleans

      t.boolean :mon, default: true
      t.boolean :tue, default: true
      t.boolean :wed, default: true
      t.boolean :thu, default: true
      t.boolean :fri, default: true
      t.boolean :sat, default: true
      t.boolean :sun, default: true

      t.date :start_date, default: Time.now     #for recurrence
      t.date :end_date, default: Time.now       #TODO remove
      t.time :start_time, default: Time.now     #for reminders
      t.time :end_time                          #for reminders

      t.timestamps
    end
  end

  def down
    drop_table :routines
  end
end
