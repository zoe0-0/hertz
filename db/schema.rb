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

ActiveRecord::Schema.define(version: 20180723065221) do

  create_table "channels", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "onair",      default: 0
    t.float    "frequency",              null: false
    t.integer  "category",   default: 0
    t.string   "title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "channels", ["user_id"], name: "index_channels_on_user_id"

  create_table "diaries", force: :cascade do |t|
    t.integer  "max_audience", default: 0
    t.text     "content"
    t.datetime "finished_at"
    t.integer  "channel_id"
    t.string   "title"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "diaries", ["channel_id"], name: "index_diaries_on_channel_id"

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "stories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "channel_id"
    t.text     "content"
    t.integer  "read",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stories", ["channel_id"], name: "index_stories_on_channel_id"
  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "timetables", force: :cascade do |t|
    t.integer  "channel_id"
    t.datetime "start",      null: false
    t.datetime "end",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "timetables", ["channel_id"], name: "index_timetables_on_channel_id"

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
    t.integer  "postcard",               default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
