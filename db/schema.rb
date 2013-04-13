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

ActiveRecord::Schema.define(:version => 20130325203707) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.integer  "temple_id"
    t.integer  "category_id"
    t.string   "author"
    t.string   "shelve_location"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "book_number"
    t.string   "label"
  end

  add_index "books", ["category_id"], :name => "index_books_on_category_id"
  add_index "books", ["temple_id"], :name => "index_books_on_temple_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_periods", :force => true do |t|
    t.date     "start_date"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "course_periods", ["course_id"], :name => "index_course_periods_on_course_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inventories", :force => true do |t|
    t.integer  "book_id"
    t.integer  "borrow_out",      :default => 0
    t.integer  "temple_out",      :default => 0
    t.integer  "course_out",      :default => 0
    t.integer  "quantity",        :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.integer  "shelve_quantity"
  end

  add_index "inventories", ["book_id"], :name => "index_inventories_on_book_id"

  create_table "lendings", :force => true do |t|
    t.integer  "book_id"
    t.date     "date_of_lend"
    t.date     "date_of_return"
    t.date     "due_date"
    t.integer  "user_id"
    t.integer  "course_period_id"
    t.boolean  "returned",         :default => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "lendings", ["book_id"], :name => "index_lendings_on_book_id"
  add_index "lendings", ["course_period_id"], :name => "index_lendings_on_course_period_id"
  add_index "lendings", ["user_id"], :name => "index_lendings_on_user_id"

  create_table "members", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "apt"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "work_phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "temples", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",                  :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "name"
    t.string   "username"
    t.integer  "role_id"
    t.string   "library_id",             :limit => 5
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
