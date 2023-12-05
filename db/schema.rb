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

ActiveRecord::Schema[7.1].define(version: 2023_12_05_142738) do
  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.index ["owner_id"], name: "index_campaigns_on_owner_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_characters_on_player_id"
  end

  create_table "dungeon_masters", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["campaign_id"], name: "index_dungeon_masters_on_campaign_id"
    t.index ["user_id"], name: "index_dungeon_masters_on_user_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "campaign_id", null: false
    t.string "who_is_up_type"
    t.integer "who_is_up_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_encounters_on_campaign_id"
    t.index ["who_is_up_type", "who_is_up_id"], name: "index_encounters_on_who_is_up"
  end

  create_table "initiatives", force: :cascade do |t|
    t.string "encounterable_type", null: false
    t.integer "encounterable_id", null: false
    t.integer "encounter_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounter_id"], name: "index_initiatives_on_encounter_id"
    t.index ["encounterable_type", "encounterable_id"], name: "index_initiatives_on_encounterable"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["campaign_id"], name: "index_players_on_campaign_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "status_effects", force: :cascade do |t|
    t.integer "rounds"
    t.string "encounterable_type", null: false
    t.integer "encounterable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounterable_type", "encounterable_id"], name: "index_status_effects_on_encounterable"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "campaigns", "users", column: "owner_id"
  add_foreign_key "characters", "players"
  add_foreign_key "dungeon_masters", "campaigns"
  add_foreign_key "dungeon_masters", "users"
  add_foreign_key "encounters", "campaigns"
  add_foreign_key "initiatives", "encounters"
  add_foreign_key "players", "campaigns"
  add_foreign_key "players", "users"
end
