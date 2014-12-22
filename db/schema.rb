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

ActiveRecord::Schema.define(:version => 20141222050959) do

  create_table "children", :force => true do |t|
    t.string   "number"
    t.string   "name"
    t.string   "hair_color"
    t.string   "eyes_color"
    t.string   "living_arrangement"
    t.string   "sex"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.date     "born_on"
    t.string   "relative_numbers"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "photo_url"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.text     "video_url"
  end

  create_table "contacts", :force => true do |t|
    t.string   "kind"
    t.string   "value"
    t.integer  "social_provider_id"
    t.string   "type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "contacts", ["social_provider_id"], :name => "index_contacts_on_social_provider_id"

  create_table "contest_votes", :force => true do |t|
    t.text     "ip"
    t.text     "user_agent"
    t.text     "session_id"
    t.integer  "contest_work_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "contest_votes", ["ip"], :name => "index_contest_votes_on_ip"

  create_table "contest_works", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "photo_url"
    t.string   "work_file_name"
    t.string   "work_content_type"
    t.integer  "work_file_size"
    t.datetime "work_updated_at"
    t.text     "work_url"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "licenses", :force => true do |t|
    t.string   "seria"
    t.string   "number"
    t.text     "activity_kind"
    t.text     "issuing_organization"
    t.date     "issue_date"
    t.date     "expiration_date"
    t.integer  "social_provider_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "licenses", ["social_provider_id"], :name => "index_licenses_on_social_provider_id"

  create_table "requests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "social_forms", :force => true do |t|
    t.string   "kind"
    t.integer  "places_number"
    t.integer  "free_places_number"
    t.integer  "social_provider_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "social_forms", ["social_provider_id"], :name => "index_social_forms_on_social_provider_id"

  create_table "social_providers", :force => true do |t|
    t.text     "title"
    t.text     "short_title"
    t.date     "register_date"
    t.text     "incorporation_form"
    t.text     "address"
    t.text     "chief_fio"
    t.text     "terms_of_service"
    t.text     "audits"
    t.text     "work_experience"
    t.text     "additional_info"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "user_id"
    t.string   "site"
    t.string   "state"
    t.text     "revert_to_draft_reason"
  end

  create_table "social_services", :force => true do |t|
    t.string   "kind"
    t.text     "title"
    t.string   "price"
    t.integer  "social_provider_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "social_services", ["social_provider_id"], :name => "index_social_services_on_social_provider_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
