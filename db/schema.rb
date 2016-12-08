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

ActiveRecord::Schema.define(version: 20161208011716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_rental_requests", force: :cascade do |t|
    t.integer  "cat_id",     null: false
    t.date     "end_date",   null: false
    t.date     "start_date", null: false
    t.string   "status",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "cat_rental_requests", ["cat_id"], name: "index_cat_rental_requests_on_cat_id", using: :btree
  add_index "cat_rental_requests", ["user_id"], name: "index_cat_rental_requests_on_user_id", using: :btree

  create_table "cats", force: :cascade do |t|
    t.date     "birth_date",            null: false
    t.string   "color",                 null: false
    t.string   "name",                  null: false
    t.string   "sex",         limit: 1, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",               null: false
  end

  add_index "cats", ["user_id"], name: "index_cats_on_user_id", using: :btree

  create_table "session_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "client"
  end

  add_index "session_tokens", ["token"], name: "index_session_tokens_on_token", unique: true, using: :btree
  add_index "session_tokens", ["user_id"], name: "index_session_tokens_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
