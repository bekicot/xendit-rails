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

ActiveRecord::Schema.define(version: 2020_04_11_160747) do
  create_table "xendit_invoice_payments", force: :cascade do |t|
    t.string "user_id"
    t.string "external_id"
    t.boolean "high"
    t.string "merchant_name"
    t.bigint "amount"
    t.string "status"
    t.string "payer_email"
    t.text "description"
    t.bigint "fees_paid_amount"
    t.bigint "adjusted_received_amount"
    t.string "bank_code"
    t.string "retail_outlet_name"
    t.string "ewallet_type"
    t.string "on_demand_link"
    t.string "recurring_payment_id"
    t.bigint "paid_amount"
    t.string "mid_label"
    t.string "currency"
    t.string "success_redirect_url"
    t.string "failure_redirect_url"
    t.datetime "paid_at"
    t.string "credit_card_charge_id"
    t.string "payment_method"
    t.string "payment_channel"
    t.string "payment_destination"
    t.integer "invoice_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_xendit_invoice_payments_on_invoice_id"
  end

  create_table "xendit_invoices", id: :string, force: :cascade do |t|
    t.string "user_id"
    t.string "external_id"
    t.string "status"
    t.string "merchant_name"
    t.string "merchant_profile_picture_url"
    t.bigint "amount"
    t.string "payer_email"
    t.text "description"
    t.string "invoice_url"
    t.datetime "expiry_date"
    t.text "available_banks"
    t.text "available_retail_outlets"
    t.boolean "exclude_credit_card"
    t.boolean "send_email"
    t.text "mid_label"
    t.string "currency"
    t.datetime "paid_at"
    t.string "credit_card_charge_id"
    t.string "payment_method"
    t.string "payment_channel"
    t.string "payment_destination"
    t.string "success_redirect_url"
    t.string "failure_redirect_url"
    t.string "fixed_va"
    t.integer "recurring_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recurring_id"], name: "index_xendit_invoices_on_recurring_id"
  end

  create_table "xendit_payments", id: :string, force: :cascade do |t|
    t.bigint "amount"
    t.datetime "transaction_timestamp"
    t.string "virtual_account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["virtual_account_id"], name: "index_xendit_payments_on_virtual_account_id"
  end

  create_table "xendit_recurrings", id: :string, force: :cascade do |t|
    t.string "user_id"
    t.string "external_id"
    t.string "status"
    t.string "amount"
    t.string "payer_email"
    t.text "description"
    t.boolean "send_email"
    t.string "interval"
    t.integer "interval_count"
    t.integer "total_recurrence"
    t.integer "recurrence_progress"
    t.string "last_created_invoice_url"
    t.string "credit_card_token"
    t.string "success_redirect_url"
    t.string "failure_redirect_url"
    t.integer "invoice_duration"
    t.boolean "charge_immediately"
    t.boolean "recharge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
