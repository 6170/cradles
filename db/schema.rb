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

ActiveRecord::Schema.define(:version => 20121205003525) do

  create_table "conversations", :force => true do |t|
    t.integer  "volunteer_id"
    t.integer  "teacher_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "v_read"
    t.boolean  "t_read"
  end

  create_table "conversations_teachers", :id => false, :force => true do |t|
    t.integer "conversation_id"
    t.integer "teacher_id"
  end

  create_table "conversations_volunteers", :id => false, :force => true do |t|
    t.integer "conversation_id"
    t.integer "volunteer_id"
  end

  create_table "interests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interests_volunteers", :id => false, :force => true do |t|
    t.integer "interest_id"
    t.integer "volunteer_id"
  end

  add_index "interests_volunteers", ["interest_id", "volunteer_id"], :name => "index_interests_volunteers_on_interest_id_and_volunteer_id"

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.string  "from"
    t.string  "to"
    t.integer  "conversation_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "was_read"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "zipcode"
    t.string   "school_type"
    t.string   "location"
    t.decimal  "lat",         :precision => 10, :scale => 6
    t.decimal  "lng",         :precision => 10, :scale => 6
  end

  create_table "schools_volunteers", :id => false, :force => true do |t|
    t.integer "school_id"
    t.integer "volunteer_id"
  end

  add_index "schools_volunteers", ["school_id", "volunteer_id"], :name => "index_schools_volunteers_on_school_id_and_volunteer_id"

  create_table "teachers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "school_id"
    t.string   "school_name"
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

  create_table "volunteers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "interests"
    t.boolean  "profile_complete"
  end

  add_index "volunteers", ["email"], :name => "index_volunteers_on_email", :unique => true
  add_index "volunteers", ["reset_password_token"], :name => "index_volunteers_on_reset_password_token", :unique => true

end
