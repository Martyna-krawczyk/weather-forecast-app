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

ActiveRecord::Schema.define(version: 2019_10_01_045809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "forecasts", force: :cascade do |t|
    t.integer "min_temp", default: 0, null: false
    t.integer "max_temp", default: 0, null: false
    t.string "short_description", null: false
    t.integer "chance_of_rain", default: 0, null: false
    t.text "long_description", null: false
    t.string "uv_index"
    t.date "date", null: false
    t.string "possible_rainfall"
    t.text "image_url", null: false
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_forecasts_on_city_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.text "warnings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cities", "states"
  add_foreign_key "forecasts", "cities"
end
