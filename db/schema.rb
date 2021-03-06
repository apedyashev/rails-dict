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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130923214425) do

  create_table "activity_logs", :force => true do |t|
    t.string   "action",     :limit => 15
    t.string   "ip_addr",    :limit => 20
    t.string   "x_ip_addr",  :limit => 20
    t.string   "url"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id"
    t.string   "data",       :limit => 5000
    t.string   "user_agent", :limit => 5000
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "token"
    t.string   "token_secret"
  end

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "collaborators", :force => true do |t|
    t.integer  "dictionary_id"
    t.integer  "user_id"
    t.boolean  "can_edit",      :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "dict_entries", :force => true do |t|
    t.string   "phrase"
    t.text     "translation"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "dictionary_id"
  end

  create_table "dictionaries", :force => true do |t|
    t.string   "language1"
    t.string   "language2"
    t.boolean  "is_public",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
  end

  create_table "user_connections", :force => true do |t|
    t.integer  "user_id"
    t.integer  "connected_user_id"
    t.boolean  "is_connection_accepted"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "avatar"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "gender",     :limit => 10
  end

end
