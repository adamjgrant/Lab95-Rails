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

ActiveRecord::Schema.define(version: 20140824232301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "inputs", force: true do |t|
    t.integer  "widget_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inputs", ["widget_id"], name: "index_inputs_on_widget_id", using: :btree

  create_table "panels", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "panels", ["user_id"], name: "index_panels_on_user_id", using: :btree

  create_table "settings", force: true do |t|
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["account_id"], name: "index_settings_on_account_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "widget_types", force: true do |t|
    t.integer  "widget_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "widget_types", ["widget_id"], name: "index_widget_types_on_widget_id", using: :btree

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.integer  "type"
    t.integer  "panel_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "widget_type"
    t.integer  "input"
  end

  add_index "widgets", ["panel_id"], name: "index_widgets_on_panel_id", using: :btree

end
