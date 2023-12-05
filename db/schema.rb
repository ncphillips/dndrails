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

ActiveRecord::Schema[7.1].define(version: 2023_12_05_011512) do
  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_characters_on_player_id"
  end

  create_table "dungeon_masters", force: :cascade do |t|
    t.string "name"
    t.integer "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_dungeon_masters_on_campaign_id"
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
    t.integer "encounterable_id", null: false
    t.integer "encounter_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounter_id"], name: "index_initiatives_on_encounter_id"
    t.index ["encounterable_id"], name: "index_initiatives_on_encounterable_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_players_on_campaign_id"
  end

  create_table "status_effects", force: :cascade do |t|
    t.integer "rounds"
    t.string "encounterable_type", null: false
    t.integer "encounterable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encounterable_type", "encounterable_id"], name: "index_status_effects_on_encounterable"
  end

  add_foreign_key "characters", "players"
  add_foreign_key "dungeon_masters", "campaigns"
  add_foreign_key "encounters", "campaigns"
  add_foreign_key "initiatives", "encounterables"
  add_foreign_key "initiatives", "encounters"
  add_foreign_key "players", "campaigns"
end
