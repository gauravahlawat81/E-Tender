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

ActiveRecord::Schema.define(version: 2020_02_16_152819) do

  create_table "conversations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.bigint "tender_id"
    t.integer "type_of_message", default: 0, null: false
    t.bigint "nominee"
    t.string "remark"
    t.integer "approve", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "doc10s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head"
    t.string "item_name"
    t.string "type"
    t.integer "quantity"
    t.integer "estimated_cost"
    t.date "date"
    t.time "time"
    t.string "venue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tender_id"], name: "index_doc10s_on_tender_id"
  end

  create_table "doc1s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head", default: "", null: false
    t.string "item_name", default: "", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "estimated_cost", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "type_of_tender", default: 0
    t.bigint "user_id", null: false
    t.index ["tender_id"], name: "index_doc1s_on_tender_id"
    t.index ["user_id"], name: "fk_rails_9c427b3d8b"
  end

  create_table "doc2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head"
    t.string "item_name"
    t.string "type"
    t.integer "quantity"
    t.integer "estimated_cost"
    t.date "date"
    t.time "time"
    t.string "venue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tender_id"], name: "index_doc2s_on_tender_id"
  end

  create_table "doc5s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head"
    t.string "item_name"
    t.string "type"
    t.integer "quantity"
    t.integer "estimated_cost"
    t.date "date"
    t.time "time"
    t.string "venue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tender_id"], name: "index_doc5s_on_tender_id"
  end

  create_table "doc6s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head"
    t.string "item_name"
    t.string "type"
    t.integer "number_bids_received"
    t.integer "number_bidder_representative"
    t.integer "number_of_bids_accepted"
    t.text "name_of_accepted_firms"
    t.integer "number_of_bids_rejected"
    t.text "name_of_rejected_firms"
    t.date "date_of_financial_bid_opening"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tender_id"], name: "index_doc6s_on_tender_id"
  end

  create_table "doc7s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head"
    t.string "item_name"
    t.string "type"
    t.integer "quantity"
    t.integer "estimated_cost"
    t.date "date"
    t.time "time"
    t.string "venue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tender_id"], name: "index_doc7s_on_tender_id"
  end

  create_table "doc9s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head"
    t.string "item_name"
    t.string "type"
    t.integer "number_bids_received"
    t.integer "number_bidder_representative"
    t.integer "number_of_bids_accepted"
    t.text "name_of_accepted_firms"
    t.integer "number_of_bids_rejected"
    t.text "name_of_rejected_firms"
    t.date "date_of_financial_bid_opening"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tender_id"], name: "index_doc9s_on_tender_id"
  end

  create_table "docs1s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "debit_head", default: "", null: false
    t.string "item_name", default: "", null: false
    t.integer "quantity", default: 0
    t.integer "estimated_cost", default: 0, null: false
    t.integer "status", default: 0
    t.index ["tender_id"], name: "index_docs1s_on_tender_id"
  end

  create_table "tenders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0
    t.integer "doc1_status", default: 0
    t.string "ref_id", default: ""
    t.bigint "purchase_commitee"
    t.index ["user_id"], name: "index_tenders_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "department", default: "", null: false
    t.string "position", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doc10s", "tenders"
  add_foreign_key "doc1s", "tenders"
  add_foreign_key "doc1s", "users"
  add_foreign_key "doc2s", "tenders"
  add_foreign_key "doc5s", "tenders"
  add_foreign_key "doc6s", "tenders"
  add_foreign_key "doc7s", "tenders"
  add_foreign_key "doc9s", "tenders"
  add_foreign_key "docs1s", "tenders"
  add_foreign_key "tenders", "users"
end
