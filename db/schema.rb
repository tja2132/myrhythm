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

ActiveRecord::Schema[7.1].define(version: 2023_12_02_183631) do
  create_table "completions", force: :cascade do |t|
    t.integer "routine_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["routine_id"], name: "index_completions_on_routine_id"
  end

  create_table "routines", force: :cascade do |t|
    t.string "title", default: "New Routine"
    t.text "description"
    t.time "start_time", default: "2000-01-01 08:00:00"
    t.boolean "mon", default: false, null: false
    t.boolean "tue", default: false, null: false
    t.boolean "wed", default: false, null: false
    t.boolean "thu", default: false, null: false
    t.boolean "fri", default: false, null: false
    t.boolean "sat", default: false, null: false
    t.boolean "sun", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.boolean "is_public", default: false, null: false
    t.boolean "home", default: false, null: false
    t.boolean "work", default: false, null: false
    t.boolean "school", default: false, null: false
    t.index ["user_id"], name: "index_routines_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "routine_id", null: false
    t.integer "sequence"
    t.string "title", default: "New Task"
    t.string "description"
    t.integer "duration", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url", default: ""
    t.index ["routine_id"], name: "index_tasks_on_routine_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "inactive", default: false, null: false
    t.string "calendar_day", default: "Monday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "columbia_uni"
    t.datetime "deleted_on"
    t.string "default_calendar"
    t.string "default_insights"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "completions", "routines"
  add_foreign_key "routines", "users"
  add_foreign_key "tasks", "routines"
end
