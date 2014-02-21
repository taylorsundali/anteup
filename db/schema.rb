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

ActiveRecord::Schema.define(version: 20140220201828) do

  create_table "attendee_specifics", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "attendee_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendee_specifics", ["user_id", "event_id"], name: "index_attendee_specifics_on_user_id_and_event_id", using: :btree

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.integer  "attendee_floor"
    t.integer  "attendee_ceiling"
    t.integer  "price_per_person"
    t.string   "event_name"
    t.string   "event_location"
    t.date     "ante_date"
    t.time     "ante_time",        default: '2000-01-01 00:00:00'
    t.date     "event_date"
    t.time     "event_time",       default: '2000-01-01 00:00:00'
    t.string   "event_status",     default: "New"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: true do |t|
    t.integer  "user_id"
    t.text     "feedback_entry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
