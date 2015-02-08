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

ActiveRecord::Schema.define(version: 20150208014959) do

  create_table "businesses", force: :cascade do |t|
    t.string   "business_yid"
    t.string   "name"
    t.string   "neighborhoods"
    t.string   "full_address"
    t.string   "city"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.decimal  "stars"
    t.integer  "review_count"
    t.string   "categories"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.string   "user_yid"
    t.string   "friend_yid"
    t.decimal  "match"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "relationships", ["friend_yid"], name: "index_relationships_on_friend_yid"
  add_index "relationships", ["user_yid"], name: "index_relationships_on_user_yid"

  create_table "reviews", force: :cascade do |t|
    t.string   "business_yid"
    t.string   "user_yid"
    t.decimal  "stars"
    t.string   "text"
    t.string   "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reviews", ["business_yid"], name: "index_reviews_on_business_yid"
  add_index "reviews", ["user_yid"], name: "index_reviews_on_user_yid"

  create_table "users", force: :cascade do |t|
    t.string   "user_yid"
    t.string   "user_name"
    t.integer  "review_count"
    t.decimal  "average_stars"
    t.integer  "votes"
    t.string   "elite"
    t.string   "yelping_since"
    t.integer  "fans"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["user_yid"], name: "index_users_on_user_yid", unique: true

end
