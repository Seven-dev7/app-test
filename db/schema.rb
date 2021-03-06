# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_11_110349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.integer "code"
    t.string "alpha_2"
    t.string "alpha_3"
    t.string "name_fr"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "embassies", force: :cascade do |t|
    t.string "in_country"
    t.float "latitude"
    t.float "longitude"
    t.float "gps"
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_embassies_on_country_id"
  end

  create_table "foreigners", force: :cascade do |t|
    t.string "country_name"
    t.integer "year"
    t.integer "number_of_french"
    t.string "foreignable_type"
    t.bigint "foreignable_id"
    t.index ["foreignable_type", "foreignable_id"], name: "index_foreigners_on_foreignable_type_and_foreignable_id"
  end

end
