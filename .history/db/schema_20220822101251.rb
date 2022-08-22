<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2022_08_20_081935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "date"
    t.datetime "time"
    t.string "origin"
    t.string "destination"
    t.integer "distance"
    t.integer "cost"
    t.string "houseSize"
    t.integer "user_id", null: false
    t.integer "mover_id", null: false
  end
=======

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.boolean "is_admin", default: true, null: false
    t.boolean "is_mover", default: false, null: false
    t.boolean "is_client", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.boolean "is_admin", default: false, null: false
    t.boolean "is_mover", default: true, null: false
    t.boolean "is_client", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.boolean "is_admin", default: false, null: false
    t.boolean "is_mover", default: false, null: false
    t.boolean "is_client", default: true, null: false
>>>>>>> 79030e2cc6b8426c2b7e61136995a76a9900c634
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
