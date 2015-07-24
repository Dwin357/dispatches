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

ActiveRecord::Schema.define(version: 20150724140405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deficiencies", force: true do |t|
    t.integer  "vehicle_id"
    t.string   "vehicle_type"
    t.string   "deficiency"
    t.boolean  "deadlined",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dispatches", force: true do |t|
    t.integer  "truck_id"
    t.integer  "mission_id"
    t.boolean  "out_wire",          default: false
    t.boolean  "safe_return",       default: false
    t.integer  "miles_at_return"
    t.integer  "miles_at_dispatch"
    t.integer  "gallons_used",      default: 0
    t.integer  "oil_used",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missions", force: true do |t|
    t.string   "name"
    t.string   "unit_serviced"
    t.datetime "step_off_at"
    t.datetime "return_at"
    t.boolean  "initiated",     default: false
    t.boolean  "completed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payloads", force: true do |t|
    t.string   "payload"
    t.integer  "vehicle_id"
    t.string   "vehicle_type"
    t.boolean  "downloaded",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resource_statuses", force: true do |t|
    t.integer  "resource_id"
    t.string   "resource_type"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rest_points", force: true do |t|
    t.integer  "mission_id"
    t.string   "point"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "soldier_assignments", force: true do |t|
    t.integer  "soldier_id"
    t.integer  "dispatch_id"
    t.string   "role"
    t.boolean  "out_wire",    default: false
    t.boolean  "safe_return", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "soldiers", force: true do |t|
    t.string   "name"
    t.string   "rank"
    t.string   "phone_number"
    t.string   "weapon_number"
    t.string   "weapon_serial"
    t.string   "cco_serial"
    t.integer  "miles",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trailer_assignments", force: true do |t|
    t.integer  "dispatch_id"
    t.integer  "trailer_id"
    t.boolean  "out_wire",    default: false
    t.boolean  "safe_return", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trailers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trucks", force: true do |t|
    t.string   "name"
    t.string   "pen_name"
    t.string   "model"
    t.string   "radio_NSN"
    t.integer  "odometer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
