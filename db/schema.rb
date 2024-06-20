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

ActiveRecord::Schema[7.1].define(version: 2024_06_20_051445) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "provider_price"
    t.decimal "public_price"
    t.index ["provider_id"], name: "index_activities_on_provider_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "code", null: false
    t.string "state"
    t.integer "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_branches_on_code", unique: true
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.index ["branch_id"], name: "index_providers_on_branch_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "branch_id"
    t.string "name"
    t.index ["branch_id"], name: "index_users_on_branch_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vouchers", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "contact_name"
    t.string "contact_email"
    t.integer "activity_id", null: false
    t.integer "status"
    t.integer "payment_type"
    t.decimal "total", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "branched_id"
    t.boolean "payment_tax"
    t.integer "user_id"
    t.text "comment"
    t.date "reservation_date", null: false
    t.index ["activity_id"], name: "index_vouchers_on_activity_id"
    t.index ["id"], name: "index_vouchers_on_id", unique: true
    t.index ["user_id"], name: "index_vouchers_on_user_id"
  end

  add_foreign_key "activities", "providers"
  add_foreign_key "providers", "branches"
  add_foreign_key "users", "branches"
  add_foreign_key "vouchers", "activities"
  add_foreign_key "vouchers", "users"
end
