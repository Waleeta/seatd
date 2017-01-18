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

ActiveRecord::Schema.define(version: 20170118224239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.boolean  "booked",      default: false
    t.datetime "start_time",                  null: false
    t.datetime "end_time",                    null: false
    t.integer  "client_id"
    t.integer  "service_id",                  null: false
    t.integer  "employee_id",                 null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "business_name",                            null: false
    t.string   "hashed_password",                          null: false
    t.string   "email",                                    null: false
    t.string   "address",                                  null: false
    t.time     "open_at",                                  null: false
    t.time     "close_at",                                 null: false
    t.string   "lat",             default: "41.8762291",   null: false
    t.string   "long",            default: "-87.6532040",  null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "phone"
    t.string   "website"
    t.string   "icon",            default: "ion-scissors"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name",                                                                                                            null: false
    t.string   "description",                                                                                                     null: false
    t.string   "photo",       default: "https://s-media-cache-ak0.pinimg.com/736x/48/14/d7/4814d77525b02730db6817b135cf3d5f.jpg", null: false
    t.integer  "business_id",                                                                                                     null: false
    t.datetime "created_at",                                                                                                      null: false
    t.datetime "updated_at",                                                                                                      null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "service_type",             null: false
    t.integer  "category_id",              null: false
    t.integer  "employee_id",              null: false
    t.integer  "business_id",  default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "name",            null: false
    t.string   "hashed_password", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "auth_token"
  end

end
