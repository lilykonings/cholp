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

ActiveRecord::Schema.define(version: 20150930073234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "time"
    t.string   "comment"
    t.integer  "print_id"
  end

  create_table "creators", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "name"
    t.string   "banner"
    t.string   "icon"
    t.text     "description"
    t.integer  "num_prints"
    t.integer  "number_prints"
    t.integer  "num_subscribers"
    t.integer  "user_id"
    t.boolean  "featured"
  end

  create_table "features", force: true do |t|
    t.datetime "created_at"
    t.string   "tab_title"
    t.string   "title"
    t.text     "description"
    t.string   "image"
    t.string   "link"
  end

  add_index "features", ["id"], name: "index_features_on_id", unique: true, using: :btree

  create_table "prints", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.string   "path"
    t.string   "picture_zero"
    t.string   "picture_one"
    t.string   "picture_two"
    t.string   "picture_three"
    t.string   "picture_four"
    t.string   "picture_five"
    t.integer  "num_prints"
    t.float    "min_x"
    t.float    "min_y"
    t.float    "min_z"
    t.string   "materials"
    t.boolean  "color_supported"
    t.string   "recommended_printers"
    t.float    "resolution"
    t.float    "tolerance"
    t.integer  "creator_id"
    t.boolean  "featured"
    t.decimal  "price",                precision: 5, scale: 2
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "sub_by"
    t.integer  "sub_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "purchased_at"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.string   "transaction_id"
    t.string   "status"
    t.text     "notification_params"
    t.integer  "print_id"
  end

  add_index "transactions", ["id"], name: "index_transactions_on_id", unique: true, using: :btree

  create_table "updates", force: true do |t|
    t.datetime "created_at"
    t.string   "title"
    t.string   "link"
    t.text     "description"
  end

  add_index "updates", ["id"], name: "index_updates_on_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "username"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "google_plus"
    t.string   "paypal"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
