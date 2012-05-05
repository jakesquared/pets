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

ActiveRecord::Schema.define(:version => 20120505003456) do

  create_table "pets", :force => true do |t|
    t.string  "name"
    t.string  "breed"
    t.string  "species"
    t.string  "gender"
    t.text    "photo"
    t.string  "zip"
    t.string  "size"
    t.string  "age"
    t.text    "description"
    t.string  "status"
    t.string  "kill_date"
    t.string  "kill_reason"
    t.integer "remote_id"
    t.string  "click_url"
    t.string  "provider"
  end

  add_index "pets", ["provider", "remote_id"], :name => "index_pets_on_provider_and_remote_id", :unique => true

  create_table "zip", :force => true do |t|
    t.integer  "ila_bucket"
    t.integer  "ila_tier"
    t.string   "zip",        :limit => 5
    t.integer  "city_id"
    t.string   "city"
    t.string   "county"
    t.string   "state",      :limit => 2
    t.string   "state_full"
    t.decimal  "lat",                     :precision => 9, :scale => 6
    t.decimal  "lon",                     :precision => 9, :scale => 6
    t.integer  "areacode"
    t.integer  "fips"
    t.integer  "zip_count"
    t.integer  "is_hidden"
    t.integer  "population"
    t.datetime "create_dt"
    t.datetime "modify_dt"
  end

end
