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

ActiveRecord::Schema.define(version: 2021_09_09_120047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.text "name_of_book"
    t.text "description"
    t.text "author"
    t.integer "no_of_books_available"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "custumer_id"
    t.text "main_img"
    t.text "detail_img"
    t.index ["custumer_id"], name: "index_books_on_custumer_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "custumer_id"
    t.index ["book_id"], name: "index_comments_on_book_id"
    t.index ["custumer_id"], name: "index_comments_on_custumer_id"
  end

  create_table "custumers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_custumers_on_email", unique: true
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "custumer_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_likes_on_book_id"
    t.index ["custumer_id"], name: "index_likes_on_custumer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "amount"
    t.string "status"
    t.text "security_key"
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_payments_on_book_id"
  end

  add_foreign_key "books", "custumers"
  add_foreign_key "comments", "books"
  add_foreign_key "comments", "custumers"
  add_foreign_key "likes", "books"
  add_foreign_key "likes", "custumers"
  add_foreign_key "payments", "books"
end
