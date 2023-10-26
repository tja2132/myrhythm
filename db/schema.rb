# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 202310180002) do
  create_table "routines", force: :cascade do |t|
    t.string "title", default: "New Routine"
    t.string "description"
    t.string "tasks"
    t.boolean "is_recurring", default: false
    t.string "recurrence"
    t.boolean "is_reminder", default: false
    t.datetime "next_reminder"
    t.datetime "next_occurrence"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", default: "New Task"
    t.string "description"
    t.boolean "is_duration", default: false
    t.integer "duration", default: 0
    t.boolean "is_recurring", default: false
    t.string "recurrence"
    t.boolean "is_reminder", default: false
    t.datetime "next_reminder"
    t.boolean "is_relative_start", default: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
