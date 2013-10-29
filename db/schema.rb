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

ActiveRecord::Schema.define(:version => 20131029055123) do

  create_table "anchorings", :force => true do |t|
    t.string   "type"
    t.string   "ship_name"
    t.string   "ship_name_en"
    t.string   "country"
    t.integer  "ship_length"
    t.string   "cargo"
    t.integer  "amount"
    t.integer  "gt"
    t.integer  "nt"
    t.integer  "max_draft"
    t.integer  "power"
    t.string   "ahchor_reason"
    t.date     "anchor_date"
    t.date     "sail_date"
    t.string   "pier"
    t.string   "ship_contact"
    t.string   "contacter"
    t.string   "cellphone"
    t.string   "fax"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
