class CreateRoutines < ActiveRecord::Migration[7.1]
  def up
    create_table :routines do |t|
      t.string :title, default: "New Routine"
      t.text :description
      t.time :start_time, default: Time.new(2000, 1, 1, 0, 0, 0) 
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
