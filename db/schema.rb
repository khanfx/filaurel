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

ActiveRecord::Schema[7.0].define(version: 1) do
  create_table "ebill_updates", force: :cascade do |t|
    t.string "ebillRef"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ebill_id"
    t.index ["ebill_id"], name: "index_ebill_updates_on_ebill_id"
  end

  create_table "ebills", force: :cascade do |t|
    t.string "userRef"
    t.string "ebillRef"
    t.decimal "amount"
    t.date "dateDue"
    t.string "billerRef"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "paymentRef"
    t.string "ebillRef"
    t.date "dateSubmitted"
    t.decimal "amount"
    t.string "fromAccountRef"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ebill_id"
    t.index ["ebill_id"], name: "index_payments_on_ebill_id"
  end

end
