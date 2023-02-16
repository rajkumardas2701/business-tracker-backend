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

ActiveRecord::Schema[7.0].define(version: 2023_02_16_171352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deals", force: :cascade do |t|
    t.string "vehicle_date"
    t.string "f_name"
    t.float "f_quantiy"
    t.float "f_choot"
    t.decimal "f_rate"
    t.string "d_name"
    t.float "d_quantity"
    t.float "d_choot"
    t.decimal "d_rate"
    t.decimal "f_actual_amount"
    t.decimal "d_actual_amount"
    t.decimal "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_transactions", force: :cascade do |t|
    t.date "date"
    t.string "action_by"
    t.string "send_receive"
    t.decimal "amount"
    t.text "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "deal_id"
    t.index ["deal_id"], name: "index_financial_transactions_on_deal_id"
    t.index ["user_id"], name: "index_financial_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone"
    t.string "password_digest"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "financial_transactions", "deals"
  add_foreign_key "financial_transactions", "users"
end
