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

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 60d37af137f937395bce63e15e16f40667b72167
ActiveRecord::Schema.define(version: 20180420222450) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "pincode"
    t.string "house_no"
    t.string "street_name"
    t.string "landmark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end
=======
ActiveRecord::Schema.define(version: 20180418155103) do
>>>>>>> 92422452049f5a93766e7474d468187e4397ccb8

  create_table "articles", force: :cascade do |t|
    t.text "description"
    t.integer "price"
    t.float "weight"
    t.float "height"
    t.string "colour"
    t.text "review"
    t.string "company"
    t.float "discount"
    t.string "material"
    t.integer "ratings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "articleimg_file_name"
    t.string "articleimg_content_type"
    t.integer "articleimg_file_size"
    t.datetime "articleimg_updated_at"
    t.string "name"
    t.integer "quantity"
    t.integer "usr_rating"
    t.string "articleimg1_file_name"
    t.string "articleimg1_content_type"
    t.integer "articleimg1_file_size"
    t.datetime "articleimg1_updated_at"
    t.string "articleimg2_file_name"
    t.string "articleimg2_content_type"
    t.integer "articleimg2_file_size"
    t.datetime "articleimg2_updated_at"
    t.string "articleimg3_file_name"
    t.string "articleimg3_content_type"
    t.integer "articleimg3_file_size"
    t.datetime "articleimg3_updated_at"
    t.string "articleimg4_file_name"
    t.string "articleimg4_content_type"
    t.integer "articleimg4_file_size"
    t.datetime "articleimg4_updated_at"
  end

  create_table "checkouts", force: :cascade do |t|
    t.string "address"
    t.integer "pincode"
    t.integer "user_id"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "orders", force: :cascade do |t|
    t.string "itemname"
    t.integer "quantity"
    t.integer "user_id"
    t.integer "item_price"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "Status"
  end

=======
>>>>>>> 92422452049f5a93766e7474d468187e4397ccb8
  create_table "payments", force: :cascade do |t|
    t.string "payment_id"
    t.string "amount"
    t.string "method"
    t.string "bank"
    t.string "email"
    t.string "contact_no"
    t.string "fee"
    t.string "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoppingcarts", force: :cascade do |t|
    t.string "itemname"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "item_price"
    t.integer "item_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "userratings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "article_id"
    t.integer "user_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "userimg_file_name"
    t.string "userimg_content_type"
    t.integer "userimg_file_size"
    t.datetime "userimg_updated_at"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
