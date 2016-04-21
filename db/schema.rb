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

ActiveRecord::Schema.define(version: 20150523151338) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "link"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "text"
    t.integer  "visits"
    t.string   "image_url"
    t.string   "format"
    t.integer  "category_id"
    t.datetime "happened_at"
    t.text     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subposts", force: :cascade do |t|
    t.integer  "post_id"
    t.text     "text"
    t.string   "icon"
    t.datetime "happened_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
