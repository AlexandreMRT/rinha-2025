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

ActiveRecord::Schema[8.0].define(version: 2025_07_08_181748) do
  create_table "payments", force: :cascade do |t|
    t.string "correlation_id", null: false
    t.decimal "amount", precision: 15, scale: 2, null: false
    t.datetime "requested_at", null: false
    t.integer "processor_type", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "processed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correlation_id"], name: "index_payments_on_correlation_id", unique: true
    t.index ["processor_type", "status"], name: "index_payments_on_processor_type_and_status"
    t.index ["processor_type"], name: "index_payments_on_processor_type"
    t.index ["requested_at"], name: "index_payments_on_requested_at"
    t.index ["status"], name: "index_payments_on_status"
  end
end
