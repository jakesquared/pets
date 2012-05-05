class AddZipTable < ActiveRecord::Migration
  def change
     create_table "zip" do |t|
      t.integer  "id"
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
end
