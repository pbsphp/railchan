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

ActiveRecord::Schema.define(version: 20141014172222) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "bans", force: true do |t|
    t.string   "ip",         null: false
    t.string   "reason",     null: false
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bans", ["ip"], name: "index_bans_on_ip"

  create_table "boards", force: true do |t|
    t.string   "name",            null: false
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "boards_group_id"
  end

  add_index "boards", ["boards_group_id"], name: "index_boards_on_boards_group_id"

  create_table "boards_groups", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "author"
    t.string   "subject"
    t.string   "email"
    t.string   "ip"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "topic_id"
  end

  add_index "comments", ["topic_id"], name: "index_comments_on_topic_id"

  create_table "replies", force: true do |t|
    t.integer "comment_reply_id"
    t.integer "topic_reply_id"
    t.integer "comment_reply_to_id"
    t.integer "topic_reply_to_id"
  end

  add_index "replies", ["comment_reply_id"], name: "index_replies_on_comment_reply_id"
  add_index "replies", ["comment_reply_to_id"], name: "index_replies_on_comment_reply_to_id"
  add_index "replies", ["topic_reply_id"], name: "index_replies_on_topic_reply_id"
  add_index "replies", ["topic_reply_to_id"], name: "index_replies_on_topic_reply_to_id"

  create_table "topics", force: true do |t|
    t.string   "author"
    t.string   "subject"
    t.string   "email"
    t.string   "ip"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
    t.datetime "bumped_at"
  end

  add_index "topics", ["board_id"], name: "index_topics_on_board_id"
  add_index "topics", ["bumped_at"], name: "index_topics_on_bumped_at"

end
