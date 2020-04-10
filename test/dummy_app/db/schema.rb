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

ActiveRecord::Schema.define(version: 2020_04_10_182702) do

  create_table "xendit_payments", id: :string, force: :cascade do |t|
    t.bigint "amount"
    t.datetime "transaction_timestamp"
    t.string "virtual_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["virtual_account_id"], name: "index_xendit_payments_on_virtual_account_id"
  end

  create_table "xendit_virtual_accounts", id: :string, force: :cascade do |t|
    t.string "owner_id"
    t.string "external_id"
    t.string "bank_code"
    t.string "merchant_code"
    t.string "name"
    t.string "account_number"
    t.datetime "expiration_date"
    t.boolean "closed"
    t.boolean "single_use"
    t.string "status"
    t.bigint "expected_amount"
    t.text "description"
    t.string "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "xendit_payments", "xendit_virtual_accounts", column: "virtual_account_id"
end
