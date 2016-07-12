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

ActiveRecord::Schema.define(version: 20160712040627) do

  create_table "conversations", force: :cascade do |t|
    t.integer  "first_user_id"
    t.integer  "second_user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "chat"
    t.string   "from_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.string   "from_user"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_private_messages_on_conversation_id"
    t.index ["user_id"], name: "index_private_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "session_token"
    t.string   "slug"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
