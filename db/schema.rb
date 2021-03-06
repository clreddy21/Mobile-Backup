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

ActiveRecord::Schema.define(version: 20171031050736) do

  create_table "contacts", force: :cascade do |t|
    t.string   "number"
    t.string   "name"
    t.string   "email"
    t.integer  "mobile_number_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "source"
  end

  add_index "contacts", ["mobile_number_id"], name: "index_contacts_on_mobile_number_id"

  create_table "images", force: :cascade do |t|
    t.text     "image"
    t.string   "name"
    t.date     "date"
    t.time     "time"
    t.integer  "mobile_number_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "images", ["mobile_number_id"], name: "index_images_on_mobile_number_id"

  create_table "locations", force: :cascade do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.date     "date"
    t.time     "time"
    t.integer  "mobile_number_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "locations", ["mobile_number_id"], name: "index_locations_on_mobile_number_id"

  create_table "messages", force: :cascade do |t|
    t.string   "from_name"
    t.string   "to_name"
    t.string   "from_number"
    t.string   "to_number"
    t.text     "message"
    t.date     "date"
    t.time     "time"
    t.integer  "mobile_number_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "messages", ["mobile_number_id"], name: "index_messages_on_mobile_number_id"

  create_table "mobile_numbers", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "gcm_id"
  end

end
