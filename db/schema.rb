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

ActiveRecord::Schema.define(version: 20160918230321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inks", force: :cascade do |t|
    t.string "color_name",   default: "unnamed ink", null: false
    t.string "manufacturer",                         null: false
    t.text   "description"
    t.string "line"
    t.string "ink_pic"
  end

  create_table "nibs", force: :cascade do |t|
    t.string "nib_size"
    t.string "nib_type", default: "normal", null: false
  end

  create_table "pens", force: :cascade do |t|
    t.string "name",              default: "unnamed pen", null: false
    t.string "manufacturer"
    t.text   "description"
    t.string "line"
    t.text   "filling_mechanism"
  end

  create_table "user_inks", force: :cascade do |t|
    t.integer "ink_id",                         null: false
    t.integer "user_id",                        null: false
    t.string  "color_family"
    t.boolean "is_cartridge",   default: false
    t.boolean "is_bottled",     default: false
    t.string  "cartridge_size"
    t.text    "notes"
    t.integer "num_bottles"
    t.integer "num_cartridges"
    t.boolean "favorite",       default: false
    t.boolean "will_sell",      default: false
    t.string  "bottle_size"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",                               null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
