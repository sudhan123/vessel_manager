# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_18_065909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "vessels", force: :cascade do |t|
    t.string "name"
    t.string "owner_id"
    t.string "naccs_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["naccs_code"], name: "index_vessels_on_naccs_code", unique: true
  end

  create_table "voyages", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.bigint "vessel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vessel_id"], name: "index_voyages_on_vessel_id"
  end

  add_foreign_key "voyages", "vessels"
end
