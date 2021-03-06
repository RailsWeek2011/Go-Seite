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

ActiveRecord::Schema.define(:version => 20110726095611) do

  create_table "forum_areas", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_posts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "forum_thread_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_threads", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "forum_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "german_go_leagues", :force => true do |t|
    t.integer  "brett"
    t.string   "spieler1"
    t.string   "spieler2"
    t.datetime "datum"
    t.string   "datei"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_informations", :force => true do |t|
    t.text     "anfahrt"
    t.text     "ausschreibung"
    t.text     "kontakt"
    t.datetime "voranmeldung"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_players", :force => true do |t|
    t.string   "name"
    t.string   "vorname"
    t.string   "email"
    t.boolean  "dgob"
    t.boolean  "studi"
    t.string   "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournament_results", :force => true do |t|
    t.integer  "spieler1"
    t.integer  "spieler2"
    t.integer  "ergebnis"
    t.integer  "runde"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Name"
    t.string   "Vorname"
    t.string   "Rang"
    t.string   "Club"
    t.string   "Land"
    t.boolean  "DGoB"
    t.boolean  "studi"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
