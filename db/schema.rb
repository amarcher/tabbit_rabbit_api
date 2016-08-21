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

ActiveRecord::Schema.define(version: 20151021015318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "tab_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_rabbits", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "rabbit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rabbits", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rabbits_tabs", force: :cascade do |t|
    t.integer  "tab_id"
    t.integer  "rabbit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tabs", force: :cascade do |t|
    t.string   "name",       default: "Untitled Tab"
    t.date     "dine_date",  default: '2016-08-18'
    t.text     "raw_text"
    t.string   "url"
    t.string   "img_url"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_hash"
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.integer  "avatar_rabbit_id"
    t.string   "vm_authtoken"
    t.string   "vm_authrefreshtoken"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
