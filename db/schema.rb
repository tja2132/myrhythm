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

ActiveRecord::Schema[7.1].define(version: 2023_11_14_051449) do
  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "rating"
    t.text "description"
    t.datetime "release_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routines", force: :cascade do |t|
    t.string "title", default: "New Routine"
    t.text "description"
    t.boolean "is_end_date"
    t.time "start_time", default: "2000-01-01 04:58:50"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mon"
    t.boolean "tue"
    t.boolean "wed"
    t.boolean "thu"
    t.boolean "fri"
    t.boolean "sat"
    t.boolean "sun"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "routine_id", null: false
    t.integer "sequence"
    t.string "title"
    t.string "description"
    t.integer "duration", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_id"], name: "index_tasks_on_routine_id"
  end

  add_foreign_key "tasks", "routines"
end
