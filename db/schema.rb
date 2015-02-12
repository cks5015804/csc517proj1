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

ActiveRecord::Schema.define(version: 20150212070624) do

  create_table "models", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "story_id"
  end

  add_index "projects", ["story_id"], name: "index_projects_on_story_id"
  add_index "projects", ["user_id"], name: "index_projects_on_user_id"

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "pointVal"
    t.string   "stage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "stories", ["project_id"], name: "index_stories_on_project_id"
  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "story_id"
    t.integer  "project_id"
  end

  add_index "users", ["project_id"], name: "index_users_on_project_id"
  add_index "users", ["story_id"], name: "index_users_on_story_id"

end
