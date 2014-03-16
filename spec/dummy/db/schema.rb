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

ActiveRecord::Schema.define(version: 20140316221703) do

  create_table "articles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks_taskables_question_answers", force: true do |t|
    t.integer  "option_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks_taskables_question_answers", ["author_id", "author_type"], name: "tasks_taskable_question_answers_author"
  add_index "tasks_taskables_question_answers", ["option_id"], name: "index_tasks_taskables_question_answers_on_option_id"

  create_table "tasks_taskables_question_options", force: true do |t|
    t.text     "text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks_taskables_question_options", ["question_id"], name: "index_tasks_taskables_question_options_on_question_id"

  create_table "tasks_taskables_questions", force: true do |t|
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks_taskables_verification_confirmations", force: true do |t|
    t.integer  "verification_id"
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks_taskables_verification_confirmations", ["author_id", "author_type"], name: "tasks_taskable_verification_confirmation_author", unique: true
  add_index "tasks_taskables_verification_confirmations", ["verification_id"], name: "tasks_taskable_verification_confirmation_verification"

  create_table "tasks_taskables_verifications", force: true do |t|
    t.integer  "verifiable_id"
    t.string   "verifiable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks_taskables_verifications", ["verifiable_id", "verifiable_type"], name: "index_tasks_taskable_verifications_verifiable", unique: true

  create_table "tasks_tasks", force: true do |t|
    t.integer  "taskable_id"
    t.string   "taskable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks_tasks", ["taskable_id", "taskable_type"], name: "index_tasks_tasks_on_taskable_id_and_taskable_type"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
