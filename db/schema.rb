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

ActiveRecord::Schema.define(version: 20161122145519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "admin_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "password_digest",              null: false
    t.datetime "last_login_at"
    t.string   "last_login_ip"
    t.string   "last_login_agent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "login_count",      default: 0
  end

  create_table "organization_admins", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "password_digest",              null: false
    t.uuid     "organization_id",              null: false
    t.string   "last_login_ip"
    t.string   "last_login_agent"
    t.datetime "last_login_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "login_count",      default: 0
  end

  create_table "organization_memberhsips", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "organization_id",       null: false
    t.uuid     "organization_admin_id", null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "organization_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "organization_id", null: false
    t.uuid     "user_id",         null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "organizations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",                        null: false
    t.string   "password_digest"
    t.string   "last_login_ip"
    t.string   "last_login_agent"
    t.datetime "last_login_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "login_count",      default: 0
    t.jsonb    "facebook_profile"
    t.string   "first_name",                   null: false
    t.string   "last_name",                    null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
