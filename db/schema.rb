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

ActiveRecord::Schema.define(version: 2020_06_04_184154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mods", force: :cascade do |t|
    t.string "name"
    t.string "repo"
    t.string "mod_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "description"
    t.integer "watchers"
    t.integer "stars"
    t.integer "forks"
    t.datetime "repo_updated_at"
    t.datetime "repo_created_at"
    t.string "slug"
    t.string "author_avatar"
    t.string "mod_avatar"
  end

  create_table "readmes", force: :cascade do |t|
    t.bigint "mod_id"
    t.text "content"
    t.string "url"
    t.string "encoding"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mod_id"], name: "index_readmes_on_mod_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "provider"
    t.string "uid"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "readmes", "mods"
end
