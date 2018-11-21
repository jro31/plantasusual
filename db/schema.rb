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

ActiveRecord::Schema.define(version: 2018_11_21_234520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amounts", force: :cascade do |t|
    t.bigint "ingredient_id"
    t.bigint "recipe_id"
    t.integer "size"
    t.string "unit"
    t.string "preparation"
    t.boolean "optional", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_amounts_on_ingredient_id"
    t.index ["recipe_id"], name: "index_amounts_on_recipe_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.boolean "star", default: true, null: false
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

  create_table "recipe_equipments", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "equipment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_recipe_equipments_on_equipment_id"
    t.index ["recipe_id"], name: "index_recipe_equipments_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "photo"
    t.string "method", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "user_ratings", force: :cascade do |t|
    t.integer "score", null: false
    t.bigint "user_id"
    t.bigint "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_user_ratings_on_recipe_id"
    t.index ["user_id"], name: "index_user_ratings_on_user_id"
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
  add_foreign_key "amounts", "recipes"
  add_foreign_key "favourites", "recipes"
  add_foreign_key "favourites", "users"
  add_foreign_key "recipe_equipments", "equipment"
  add_foreign_key "recipe_equipments", "recipes"
  add_foreign_key "recipes", "users"
  add_foreign_key "user_ratings", "recipes"
  add_foreign_key "user_ratings", "users"
end
