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

ActiveRecord::Schema.define(:version => 20110914061826) do

  create_table "assets", :force => true do |t|
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["attachable_id", "attachable_type"], :name => "index_assets_on_attachable_id_and_attachable_type"

  create_table "items", :force => true do |t|
    t.string   "title",         :limit => 40
    t.float    "price"
    t.integer  "quantity"
    t.string   "size",          :limit => 40
    t.string   "description",   :limit => 40
    t.float    "shippingprice"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineitems", :force => true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "price",      :precision => 11, :scale => 2
    t.string   "status"
    t.string   "item_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "order_no"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "address1"
    t.string   "address2"
    t.string   "zip_code",        :limit => 12
    t.string   "state"
    t.string   "shipping"
    t.decimal  "sale_tax",                      :precision => 11, :scale => 2
    t.decimal  "shipping_charge",               :precision => 11, :scale => 2
    t.decimal  "price",                         :precision => 11, :scale => 2
    t.decimal  "net_price",                     :precision => 11, :scale => 2
    t.boolean  "payment_status",                                               :default => false
    t.boolean  "shipping_status",                                              :default => false
    t.string   "transaction_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payment_at"
  end

  create_table "stores", :force => true do |t|
    t.string   "firstname",           :limit => 40
    t.string   "lastname",            :limit => 40
    t.string   "organizationname",    :limit => 40
    t.string   "email",               :limit => 40
    t.string   "address1",            :limit => 40
    t.string   "address2",            :limit => 40
    t.string   "city",                :limit => 40
    t.string   "state",               :limit => 40
    t.string   "zip",                 :limit => 40
    t.string   "phone",               :limit => 40
    t.string   "user_id",             :limit => 40
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "avatar_meta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sport"
    t.string   "established_in"
    t.string   "geardesignedby"
    t.string   "cause"
    t.string   "store_type"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.boolean  "status"
    t.string   "user_type"
  end

end
