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

ActiveRecord::Schema.define(version: 2018_12_18_221246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amounts", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "recipe_id"
    t.string "size"
    t.boolean "optional", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unit_id"
    t.bigint "preparation_method_id"
    t.index ["ingredient_id"], name: "index_amounts_on_ingredient_id"
    t.index ["preparation_method_id"], name: "index_amounts_on_preparation_method_id"
    t.index ["recipe_id"], name: "index_amounts_on_recipe_id"
    t.index ["unit_id"], name: "index_amounts_on_unit_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_recipes", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "category_id", null: false
  end

  create_table "comment_reports", force: :cascade do |t|
    t.string "report"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "resolved", default: false
    t.index ["comment_id"], name: "index_comment_reports_on_comment_id"
    t.index ["user_id"], name: "index_comment_reports_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false
    t.index ["recipe_id"], name: "index_comments_on_recipe_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipment_recipes", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "equipment_id", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_favourites_on_recipe_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "linked_recipes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipe_link_a"
    t.integer "recipe_link_b"
  end

  create_table "preparation_methods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "private_messages", force: :cascade do |t|
    t.text "body"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "read", default: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "recipe_relates", force: :cascade do |t|
    t.integer "relater_id"
    t.integer "relatee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_reports", force: :cascade do |t|
    t.string "report"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.boolean "resolved", default: false
    t.index ["recipe_id"], name: "index_recipe_reports_on_recipe_id"
    t.index ["user_id"], name: "index_recipe_reports_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "servings"
    t.integer "cooking_time"
    t.text "method"
    t.boolean "categories_added", default: false
    t.boolean "equipment_added", default: false
    t.boolean "deleted", default: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "recipes_recipes", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.integer "a_id"
    t.integer "b_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "measurement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "amounts", "ingredients"
  add_foreign_key "amounts", "preparation_methods"
  add_foreign_key "amounts", "recipes"
  add_foreign_key "amounts", "units"
  add_foreign_key "comment_reports", "comments"
  add_foreign_key "comment_reports", "users"
  add_foreign_key "comments", "recipes"
  add_foreign_key "comments", "users"
  add_foreign_key "favourites", "recipes"
  add_foreign_key "favourites", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "recipe_reports", "recipes"
  add_foreign_key "recipe_reports", "users"
  add_foreign_key "recipes", "users"
end
