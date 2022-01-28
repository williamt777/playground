# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_28_175902) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkpoints", force: :cascade do |t|
    t.date "check_at"
    t.integer "duration_days", default: 1
    t.string "handle"
    t.text "description"
    t.bigint "school_id"
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_checkpoints_on_school_id"
    t.index ["student_id"], name: "index_checkpoints_on_student_id"
  end

  create_table "goal_steps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "checkpoint_id"
    t.index ["checkpoint_id"], name: "index_goal_steps_on_checkpoint_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "checkpoint_id"
    t.index ["checkpoint_id"], name: "index_goals_on_checkpoint_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.text "content"
    t.datetime "entered_at"
    t.string "entry_type"
    t.text "activity_log"
    t.bigint "journal_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["journal_id"], name: "index_journal_entries_on_journal_id"
    t.index ["user_id"], name: "index_journal_entries_on_user_id"
  end

  create_table "journals", force: :cascade do |t|
    t.text "comment"
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_journals_on_student_id"
  end

  create_table "life_events", force: :cascade do |t|
    t.text "description"
    t.datetime "happened_at"
    t.text "activity_log"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_life_events_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "handle"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "grade_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "school_id"
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.datetime "party_started_at"
    t.datetime "party_ended_at"
    t.bigint "school_id"
    t.index ["school_id"], name: "index_users_on_school_id"
  end

  add_foreign_key "checkpoints", "schools"
  add_foreign_key "checkpoints", "students"
  add_foreign_key "goal_steps", "checkpoints"
  add_foreign_key "goals", "checkpoints"
  add_foreign_key "journal_entries", "journals"
  add_foreign_key "journal_entries", "users"
  add_foreign_key "journals", "students"
  add_foreign_key "life_events", "users"
  add_foreign_key "students", "schools"
  add_foreign_key "users", "schools"
end
