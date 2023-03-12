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

ActiveRecord::Schema[7.0].define(version: 2023_03_09_141230) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "publication_id"
    t.index ["publication_id"], name: "index_answers_on_publication_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "asists", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.integer "asist", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_asists_on_student_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "publication_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["publication_id"], name: "index_likes_on_publication_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "publications", force: :cascade do |t|
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "highlight"
    t.bigint "student_id"
    t.bigint "user_id"
    t.json "files"
    t.string "type"
    t.index ["student_id"], name: "index_publications_on_student_id"
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birth_date", null: false
    t.string "address", null: false
    t.integer "school_grade", default: 0, null: false
    t.boolean "attends", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "asists", "students"
  add_foreign_key "likes", "publications"
  add_foreign_key "likes", "users"
end
