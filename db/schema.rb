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

ActiveRecord::Schema[7.1].define(version: 2024_05_31_035550) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "type_id", null: false
    t.string "description", null: false
    t.integer "quantity", null: false
    t.decimal "price", precision: 19, scale: 4, null: false
    t.string "thumbnail_url", limit: 510, null: false
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "quantity > 0"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "items_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity", null: false
    t.decimal "unit_price", precision: 19, scale: 4, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "quantity > 0"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "date", null: false
    t.decimal "total_amount", precision: 19, scale: 4, null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "status::text = ANY (ARRAY['pending'::character varying::text, 'paid'::character varying::text, 'shipped'::character varying::text, 'delivered'::character varying::text, 'cancelled'::character varying::text])"
  end

  create_table "stock_transactions", force: :cascade do |t|
    t.bigint "items_id", null: false
    t.bigint "orders_id", null: false
    t.integer "change", null: false
    t.string "transaction_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "transaction_type::text = ANY (ARRAY['purchase'::character varying::text, 'sale'::character varying::text, 'return'::character varying::text, 'adjustment'::character varying::text])"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "types"
  add_foreign_key "order_items", "items", column: "items_id"
  add_foreign_key "order_items", "orders"
  add_foreign_key "stock_transactions", "items", column: "items_id"
  add_foreign_key "stock_transactions", "orders", column: "orders_id"
end
