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

ActiveRecord::Schema.define(version: 20130620112408) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "facilities", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facilities", ["type"], name: "index_facilities_on_type", using: :btree

  create_table "labs", force: true do |t|
    t.string   "state"
    t.integer  "kind"
    t.string   "name"
    t.string   "slug"
    t.text     "address"
    t.text     "notes"
    t.string   "postal_code"
    t.string   "country_code"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "urls",         array: true
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opening_times", force: true do |t|
    t.integer  "lab_id"
    t.integer  "day_of_the_week"
    t.integer  "minute"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opening_times", ["lab_id"], name: "index_opening_times_on_lab_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
