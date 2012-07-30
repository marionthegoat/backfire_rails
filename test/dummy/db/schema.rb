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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120725154733) do

  create_table "alt_controls", :force => true do |t|
    t.string  "rulebase_name",  :null => false
    t.string  "forward_back",   :null => false
    t.integer "max_iterations", :null => false
    t.boolean "show_log",       :null => false
  end

  create_table "alt_queries", :force => true do |t|
    t.string  "alt_name",       :null => false
    t.text    "alt_expression", :null => false
    t.string  "target_fact",    :null => false
    t.boolean "prompt_flag",    :null => false
  end

  create_table "alt_rules", :force => true do |t|
    t.string "rule_name",     :null => false
    t.text   "alt_assertion", :null => false
    t.text   "alt_predicate", :null => false
    t.string "target_fact",   :null => false
  end

  create_table "backfire_rails_backfire_controls", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "description"
    t.string   "rulechain_option", :null => false
    t.integer  "runaway_limit",    :null => false
    t.boolean  "log_output",       :null => false
    t.integer  "lock_version",     :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "backfire_rails_backfire_queries", :force => true do |t|
    t.integer  "backfire_control_id", :null => false
    t.string   "name",                :null => false
    t.string   "description"
    t.text     "expression",          :null => false
    t.string   "fact",                :null => false
    t.boolean  "prompt",              :null => false
    t.integer  "lock_version",        :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "backfire_rails_backfire_rules", :force => true do |t|
    t.integer  "backfire_control_id", :null => false
    t.string   "name",                :null => false
    t.string   "description"
    t.text     "assertion",           :null => false
    t.text     "predicate",           :null => false
    t.string   "fact",                :null => false
    t.integer  "lock_version",        :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "backfire_rails_backfire_sessions", :force => true do |t|
    t.integer "backfire_control_id", :null => false
    t.string  "session_key",         :null => false
    t.string  "goal_fact"
  end

end
