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

ActiveRecord::Schema.define(:version => 20140424083756) do

  create_table "tastes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "yogurt"
    t.string   "fruits"
    t.string   "topings"
    t.string   "liquid"
    t.string   "color"
    t.integer  "votes",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "sort_order"
    t.integer  "kind",       :default => 0
  end

  add_index "tastes", ["code"], :name => "index_tastes_on_code", :unique => true
  add_index "tastes", ["votes"], :name => "index_tastes_on_votes"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "taste_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "votes", ["taste_id"], :name => "index_votes_on_taste_id"
  add_index "votes", ["user_id"], :name => "index_votes_on_user_id"

end
