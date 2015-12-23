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

ActiveRecord::Schema.define(version: 20151223201458) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string   "title_text"
    t.string   "href"
    t.string   "zip"
    t.string   "cl_ymm"
    t.string   "cl_condition"
    t.string   "cl_cylinders"
    t.string   "cl_drive"
    t.string   "cl_fuel"
    t.string   "cl_paint_color"
    t.string   "cl_size"
    t.string   "cl_title_status"
    t.string   "cl_transmission"
    t.string   "cl_type"
    t.string   "ed_condition"
    t.string   "ed_cylinders"
    t.string   "ed_drive"
    t.string   "ed_fuel"
    t.string   "ed_paint_color"
    t.string   "ed_size"
    t.string   "ed_title_status"
    t.string   "ed_transmission"
    t.string   "ed_type"
    t.integer  "cl_price"
    t.integer  "ed_price"
    t.string   "cl_pid"
    t.boolean  "hidden",           default: false
    t.integer  "edmunds_make_id"
    t.integer  "edmunds_model_id"
    t.integer  "edmunds_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "edmunds_makes", force: :cascade do |t|
    t.string   "name"
    t.string   "nice_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "edmunds_models", force: :cascade do |t|
    t.string   "name"
    t.string   "nice_name"
    t.integer  "edmunds_make_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "edmunds_years", force: :cascade do |t|
    t.integer  "year"
    t.integer  "edmunds_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "zip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
