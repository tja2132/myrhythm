class CreateRoutines < ActiveRecord::Migration[7.1]
  def up
    create_table :routines do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      # todo: recurrence, etc

      t.timestamps
    end
  end

  def down
    drop_table :routines
  end
end
