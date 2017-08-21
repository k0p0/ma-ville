# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170821132321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string "attachinariable_type"
    t.bigint "attachinariable_id"
    t.string "scope"
    t.string "public_id"
    t.string "version"
    t.integer "width"
    t.integer "height"
    t.string "format"
    t.string "resource_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent"
    t.index ["attachinariable_type", "attachinariable_id"], name: "fix"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "zip_code"
    t.integer "insee_code"
    t.float "city_latitude"
    t.float "city_longitude"
    t.integer "population"
    t.float "density"
    t.float "area"
    t.string "mayor"
    t.string "region"
    t.string "department"
    t.string "council_address"
    t.string "council_phone"
    t.string "council_website"
    t.string "council_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degradations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furnitures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.date "submit_message_date"
    t.text "note"
    t.bigint "report_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_messages_on_report_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "priorities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.date "resolution_date"
    t.date "submit_date"
    t.string "address"
    t.float "report_latitude"
    t.float "report_longitude"
    t.string "picture"
    t.text "description"
    t.bigint "degradation_id"
    t.bigint "furniture_id"
    t.bigint "city_id"
    t.bigint "priority_id"
    t.bigint "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_reports_on_city_id"
    t.index ["degradation_id"], name: "index_reports_on_degradation_id"
    t.index ["furniture_id"], name: "index_reports_on_furniture_id"
    t.index ["priority_id"], name: "index_reports_on_priority_id"
    t.index ["status_id"], name: "index_reports_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "reports"
  add_foreign_key "messages", "users"
  add_foreign_key "reports", "cities"
  add_foreign_key "reports", "degradations"
  add_foreign_key "reports", "furnitures"
  add_foreign_key "reports", "priorities"
  add_foreign_key "reports", "statuses"
  add_foreign_key "users", "cities"
end
