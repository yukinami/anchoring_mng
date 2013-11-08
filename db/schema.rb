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

ActiveRecord::Schema.define(:version => 20131108063719) do

  create_table "anchorage_grounds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "anchorings", :force => true do |t|
    t.string   "category"
    t.string   "ship_name"
    t.string   "ship_name_en"
    t.string   "country"
    t.integer  "ship_length"
    t.string   "cargo"
    t.integer  "amount"
    t.string   "gt"
    t.string   "nt"
    t.integer  "max_draft"
    t.integer  "power"
    t.string   "anchor_reason"
    t.datetime "anchor_date"
    t.datetime "sail_date"
    t.string   "pier"
    t.string   "ship_contact"
    t.string   "contacter"
    t.string   "cellphone"
    t.string   "fax"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "status"
    t.integer  "anchorage_ground_id"
    t.datetime "actual_anchor_date"
    t.datetime "actual_sail_date"
    t.integer  "confirm_attn_id"
    t.integer  "anchor_attn_id"
    t.integer  "sail_attn_id"
    t.string   "report_org"
    t.string   "ship_type"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
