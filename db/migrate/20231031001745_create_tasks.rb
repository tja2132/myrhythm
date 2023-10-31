class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.references :routine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
