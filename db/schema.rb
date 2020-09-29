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

ActiveRecord::Schema.define(version: 2020_09_29_082238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amazon_products", force: :cascade do |t|
    t.string "name", null: false
    t.string "price_symbol"
    t.decimal "price", precision: 8, scale: 2, null: false
    t.decimal "price_crossed_out", precision: 8, scale: 2
    t.string "image_url"
    t.string "size_base"
    t.decimal "rating", precision: 3, scale: 2
    t.integer "review_count", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "request_urls", force: :cascade do |t|
    t.string "url", null: false
    t.datetime "requested_at"
    t.datetime "crawled_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url"], name: "index_request_urls_on_url", unique: true
  end

end
