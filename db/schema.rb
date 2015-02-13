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

ActiveRecord::Schema.define(version: 20150213170841) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "photo_id"
    t.integer  "commenter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id"
  add_index "comments", ["photo_id"], name: "index_comments_on_photo_id"

  create_table "favoritings", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "favorited_by_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "favoritings", ["favorited_by_id"], name: "index_favoritings_on_favorited_by_id"
  add_index "favoritings", ["photo_id"], name: "index_favoritings_on_photo_id"

  create_table "followings", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "leader_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "followings", ["follower_id"], name: "index_followings_on_follower_id"
  add_index "followings", ["leader_id"], name: "index_followings_on_leader_id"

  create_table "photos", force: :cascade do |t|
    t.string   "caption"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  add_index "photos", ["owner_id"], name: "index_photos_on_owner_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
