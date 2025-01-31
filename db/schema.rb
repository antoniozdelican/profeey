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

ActiveRecord::Schema.define(version: 20151124125117) do

  create_table "follow_relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4
    t.integer  "followed_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "follow_relationships", ["followed_id"], name: "index_follow_relationships_on_followed_id", using: :btree
  add_index "follow_relationships", ["follower_id", "followed_id"], name: "index_follow_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "follow_relationships", ["follower_id"], name: "index_follow_relationships_on_follower_id", using: :btree

  create_table "professions", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "professions", ["name"], name: "index_professions_on_name", unique: true, using: :btree

  create_table "professions_users", id: false, force: :cascade do |t|
    t.integer "profession_id", limit: 4
    t.integer "user_id",       limit: 4
  end

  add_index "professions_users", ["profession_id", "user_id"], name: "index_professions_users_on_profession_id_and_user_id", unique: true, using: :btree
  add_index "professions_users", ["profession_id"], name: "index_professions_users_on_profession_id", using: :btree
  add_index "professions_users", ["user_id"], name: "index_professions_users_on_user_id", using: :btree

  create_table "things", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "things", ["user_id", "created_at"], name: "index_things_on_user_id_and_created_at", using: :btree
  add_index "things", ["user_id"], name: "index_things_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                    limit: 255, default: "", null: false
    t.string   "encrypted_password",       limit: 255, default: "", null: false
    t.string   "reset_password_token",     limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",       limit: 255
    t.string   "last_sign_in_ip",          limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "full_name",                limit: 255
    t.string   "profile_pic_file_name",    limit: 255
    t.string   "profile_pic_content_type", limit: 255
    t.integer  "profile_pic_file_size",    limit: 4
    t.datetime "profile_pic_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "things", "users"
end
