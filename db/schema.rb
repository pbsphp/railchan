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

ActiveRecord::Schema.define(version: 20141004150813) do

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

  create_table "topics", force: true do |t|
    t.string   "author"
    t.string   "subject"
    t.string   "email"
    t.string   "ip"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
  end

  add_index "topics", ["board_id"], name: "index_topics_on_board_id"

end
