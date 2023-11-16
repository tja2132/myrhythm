class CreateRoutines < ActiveRecord::Migration[7.1]
  def up
    create_table :routines do |t|
      t.string :title, default: "New Routine"
      t.text :description

      t.string :recurrence, default: "None"
      t.string :daysofweek, default: ""

      t.date :start_date, default: Time.now     #for recurrence
      t.date :end_date, default: Time.now       #TODO remove
      t.time :start_time, default: Time.now     #for reminders
      t.time :end_time                          #for reminders

      t.boolean :mon, null: false, default: false
      t.boolean :tue, null: false, default: false
      t.boolean :wed, null: false, default: false
      t.boolean :thu, null: false, default: false
      t.boolean :fri, null: false, default: false
      t.boolean :sat, null: false, default: false
      t.boolean :sun, null: false, default: false
      t.timestamps
    end
  end

  def down
    drop_table :routines
  end
end
