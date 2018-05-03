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

ActiveRecord::Schema.define(version: 20180504013110) do

  create_table "conventions", force: :cascade do |t|
    t.integer  "year"
    t.integer  "convention_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "convention_id",                    null: false
    t.integer  "section"
    t.date     "date"
    t.time     "start_time"
    t.integer  "opponent_id",                      null: false
    t.integer  "home_away"
    t.integer  "weather"
    t.integer  "temperature"
    t.string   "referee"
    t.integer  "result"
    t.integer  "goal",                 default: 0
    t.integer  "goal_against",         default: 0
    t.integer  "shoot",                default: 0
    t.integer  "shoot_against",        default: 0
    t.integer  "ck",                   default: 0
    t.integer  "ck_against",           default: 0
    t.integer  "fk",                   default: 0
    t.integer  "fk_against",           default: 0
    t.integer  "yellow_card",          default: 0
    t.integer  "gave_yellow_card",     default: 0
    t.integer  "red_card",             default: 0
    t.integer  "gave_red_card",        default: 0
    t.integer  "dominance_rate"
    t.integer  "first_change_time"
    t.integer  "first_change_out_id"
    t.integer  "first_change_in_id"
    t.integer  "second_change_time"
    t.integer  "second_change_out_id"
    t.integer  "second_change_in_id"
    t.integer  "third_change_time"
    t.integer  "third_change_out_id"
    t.integer  "third_change_in_id"
    t.integer  "number_of_visitors"
    t.integer  "rank"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "pk",                   default: 0
    t.integer  "pk_against",           default: 0
    t.string   "video_url"
    t.index ["convention_id"], name: "index_games_on_convention_id"
    t.index ["first_change_in_id"], name: "index_games_on_first_change_in_id"
    t.index ["first_change_out_id"], name: "index_games_on_first_change_out_id"
    t.index ["opponent_id"], name: "index_games_on_opponent_id"
    t.index ["second_change_in_id"], name: "index_games_on_second_change_in_id"
    t.index ["second_change_out_id"], name: "index_games_on_second_change_out_id"
    t.index ["third_change_in_id"], name: "index_games_on_third_change_in_id"
    t.index ["third_change_out_id"], name: "index_games_on_third_change_out_id"
  end

  create_table "goal_against_patterns", force: :cascade do |t|
    t.integer  "game_id",                null: false
    t.integer  "goal_against_time"
    t.integer  "goal_against_player_id", null: false
    t.integer  "pattern"
    t.integer  "starting_area"
    t.integer  "goal_area"
    t.integer  "goal_parts"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["game_id"], name: "index_goal_against_patterns_on_game_id"
    t.index ["goal_against_player_id"], name: "index_goal_against_patterns_on_goal_against_player_id"
  end

  create_table "goal_patterns", force: :cascade do |t|
    t.integer  "game_id",          null: false
    t.integer  "goal_time"
    t.integer  "player_id",        null: false
    t.integer  "assist_player_id"
    t.integer  "pattern"
    t.integer  "starting_area"
    t.integer  "goal_area"
    t.integer  "goal_parts"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["assist_player_id"], name: "index_goal_patterns_on_assist_player_id"
    t.index ["game_id"], name: "index_goal_patterns_on_game_id"
    t.index ["player_id"], name: "index_goal_patterns_on_player_id"
  end

  create_table "opponents", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "category",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "short_name"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "year",       null: false
    t.integer  "number",     null: false
    t.string   "name",       null: false
    t.integer  "position",   null: false
    t.date     "birthday",   null: false
    t.integer  "height",     null: false
    t.integer  "weight",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.integer  "game_id",                   null: false
    t.integer  "player_id",                 null: false
    t.integer  "participation",             null: false
    t.integer  "time",          default: 0, null: false
    t.integer  "goal",          default: 0
    t.integer  "goal_against"
    t.integer  "shoot",         default: 0
    t.integer  "shoot_against"
    t.integer  "yellow_card",   default: 0, null: false
    t.integer  "red_card",      default: 0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "assist",        default: 0
    t.index ["game_id"], name: "index_results_on_game_id"
    t.index ["player_id"], name: "index_results_on_player_id"
  end

end
