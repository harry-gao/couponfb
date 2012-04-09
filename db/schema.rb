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

ActiveRecord::Schema.define(:version => 20120409024954) do

  create_table "coupons", :force => true do |t|
    t.integer  "merchant_id"
    t.string   "short_desc"
    t.string   "long_desc"
    t.datetime "expire_date"
    t.string   "ad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merchants", :force => true do |t|
    t.string   "name"
    t.string   "name_on_coupon"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.boolean  "deleted",        :default => false
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
