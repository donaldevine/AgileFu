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

ActiveRecord::Schema.define(:version => 20131223062621) do

  create_table "product_backlogs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "iteration"
    t.text     "reason"
    t.integer  "priority"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "project_id"
  end

  create_table "profiles", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "company"
    t.string   "website"
    t.string   "linkedin_account"
    t.string   "phone"
    t.string   "mobile"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "target_start_date"
    t.date     "target_completion_date"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "user_id"
  end

  add_index "projects", ["description"], :name => "index_projects_on_description"
  add_index "projects", ["name"], :name => "index_projects_on_name"

  create_table "sprints", :force => true do |t|
    t.integer  "project_id"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "sprint_review"
    t.integer  "priority"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "stories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.integer  "priority"
    t.integer  "best_case_estimate"
    t.integer  "worst_case_estimate"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "story_id"
    t.text     "description"
    t.integer  "priority"
    t.integer  "position"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "sprint_id"
    t.boolean  "completed"
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "tasks", ["sprint_id"], :name => "index_tasks_on_sprint_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
