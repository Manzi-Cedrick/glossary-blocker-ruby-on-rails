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

ActiveRecord::Schema[7.0].define(version: 2023_01_28_120716) do
  create_table "api_v1_glossaries", charset: "utf8mb4", force: :cascade do |t|
    t.string "source_lang_code"
    t.string "target_lang_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glossaries", charset: "utf8mb4", force: :cascade do |t|
    t.string "source_code_lang"
    t.string "target_lang_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terms", charset: "utf8mb4", force: :cascade do |t|
    t.string "source_term"
    t.string "target_term"
    t.bigint "glossary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["glossary_id"], name: "index_terms_on_glossary_id"
  end

  create_table "translations", charset: "utf8mb4", force: :cascade do |t|
    t.string "source_language_code"
    t.string "target_language_code"
    t.text "source_text"
    t.bigint "glossary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["glossary_id"], name: "index_translations_on_glossary_id"
  end

  add_foreign_key "terms", "glossaries"
  add_foreign_key "translations", "glossaries"
end
