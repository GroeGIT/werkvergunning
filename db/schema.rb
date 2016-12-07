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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161207135517) do

  create_table "agrees", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enquiry_id", limit: 4
  end

  add_index "agrees", ["enquiry_id"], name: "index_agrees_on_enquiry_id", using: :btree

  create_table "applicants", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enquiry_id", limit: 4
  end

  add_index "applicants", ["enquiry_id"], name: "index_applicants_on_enquiry_id", using: :btree

  create_table "contractors", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "applicant_id", limit: 4
  end

  add_index "contractors", ["applicant_id"], name: "index_contractors_on_applicant_id", using: :btree

  create_table "controls", force: :cascade do |t|
    t.integer "enquiry_id", limit: 4
    t.boolean "enquiry_check"
    t.boolean "workspace_check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "controls", ["enquiry_id"], name: "index_controls_on_enquiry_id", using: :btree

  create_table "enquiries", force: :cascade do |t|
    t.string "Reference", limit: 255
    t.string "Location", limit: 255
    t.text "Description", limit: 65535
    t.integer "Amount", limit: 4
    t.date     "Date"
    t.time     "Time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "applicant_id", limit: 4
    t.integer "agree_id", limit: 4
  end

  add_index "enquiries", ["agree_id"], name: "index_enquiries_on_agree_id", using: :btree
  add_index "enquiries", ["applicant_id"], name: "index_enquiries_on_applicant_id", using: :btree

  create_table "enquiry_measures", force: :cascade do |t|
    t.integer "enquiry_id", limit: 4
    t.integer "measure_id", limit: 4
    t.boolean  "done"
    t.string "responsible", limit: 255
    t.boolean  "needed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enquiry_measure_id", limit: 4
  end

  add_index "enquiry_measures", ["enquiry_id"], name: "index_enquiry_measures_on_enquiry_id", using: :btree
  add_index "enquiry_measures", ["enquiry_measure_id"], name: "index_enquiry_measures_on_enquiry_measure_id", using: :btree
  add_index "enquiry_measures", ["measure_id"], name: "index_enquiry_measures_on_measure_id", using: :btree

  create_table "measures", force: :cascade do |t|
    t.string "measurement", limit: 255
    t.string "type", limit: 255
    t.date "valid_from"
    t.date "valid_to"
    t.integer "enquiry_measure_id", limit: 4
  end

  add_index "measures", ["enquiry_measure_id"], name: "index_measures_on_enquiry_measure_id", using: :btree

  create_table "representatives", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.integer "phone", limit: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "signature_id", limit: 4
  end

  add_index "representatives", ["signature_id"], name: "index_representatives_on_signature_id", using: :btree

  create_table "signatures", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "signature", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "enquiry_id", limit: 4
  end

  add_index "signatures", ["enquiry_id"], name: "index_signatures_on_enquiry_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "email", limit: 255
    t.string "password_digest", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "agrees", "enquiries"
  add_foreign_key "applicants", "enquiries"
  add_foreign_key "contractors", "applicants"
  add_foreign_key "enquiries", "agrees"
  add_foreign_key "enquiries", "applicants"
  add_foreign_key "enquiry_measures", "enquiry_measures"
  add_foreign_key "measures", "enquiry_measures"
  add_foreign_key "representatives", "signatures"
  add_foreign_key "signatures", "enquiries"
end
