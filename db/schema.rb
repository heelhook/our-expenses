# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150215194054) do

  create_table "dues", force: :cascade do |t|
    t.integer  "due_by_id"
    t.integer  "due_to_id"
    t.string   "due_to_type"
    t.integer  "due_from_id"
    t.string   "due_from_type"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "EUR", null: false
    t.integer  "payment_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "dues", ["due_by_id"], name: "index_dues_on_due_by_id"
  add_index "dues", ["due_from_type", "due_from_id"], name: "index_dues_on_due_from_type_and_due_from_id"
  add_index "dues", ["due_to_type", "due_to_id"], name: "index_dues_on_due_to_type_and_due_to_id"
  add_index "dues", ["payment_id"], name: "index_dues_on_payment_id"

  create_table "expenses", force: :cascade do |t|
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "EUR", null: false
    t.string   "periodicity"
    t.text     "notes"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.date     "due_on"
    t.string   "category"
    t.string   "company"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "paid_by_id"
    t.integer  "paid_to_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "EUR", null: false
    t.text     "memo"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "ticket_id"
  end

  add_index "payments", ["paid_by_id"], name: "index_payments_on_paid_by_id"
  add_index "payments", ["paid_to_id"], name: "index_payments_on_paid_to_id"

  create_table "ticket_balances", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "owed_by_id"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "EUR", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "ticket_balances", ["owed_by_id"], name: "index_ticket_balances_on_owed_by_id"
  add_index "ticket_balances", ["ticket_id"], name: "index_ticket_balances_on_ticket_id"

  create_table "ticket_item_payers", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "payer_id"
    t.float    "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "guessed"
  end

  add_index "ticket_item_payers", ["item_id"], name: "index_ticket_item_payers_on_item_id"
  add_index "ticket_item_payers", ["payer_id"], name: "index_ticket_item_payers_on_payer_id"

  create_table "ticket_items", force: :cascade do |t|
    t.integer  "ticket_id"
    t.string   "description"
    t.integer  "amount_cents",    default: 0,     null: false
    t.string   "amount_currency", default: "EUR", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "ticket_items", ["ticket_id"], name: "index_ticket_items_on_ticket_id"

  create_table "tickets", force: :cascade do |t|
    t.string   "category"
    t.string   "company"
    t.integer  "paid_by_id"
    t.boolean  "reviewed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tickets", ["paid_by_id"], name: "index_tickets_on_paid_by_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
