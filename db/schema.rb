# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_613_100_225) do
  create_table 'music_records', force: :cascade do |t|
    t.string 'title', limit: 120, null: false
    t.string 'photo'
    t.integer 'price', null: false
    t.text 'description'
    t.text 'damage_assessment', limit: 120
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['title'], name: 'index_music_records_on_title', unique: true
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'music_record_id', null: false
    t.datetime 'ordered_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['music_record_id'], name: 'index_orders_on_music_record_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'rentals', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'music_record_id', null: false
    t.date 'rented_at'
    t.date 'returned_at'
    t.text 'damage_assessment'
    t.integer 'price'
    t.text 'note'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['music_record_id'], name: 'index_rentals_on_music_record_id'
    t.index ['rented_at'], name: 'index_rentals_on_rented_at'
    t.index ['user_id'], name: 'index_rentals_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name', limit: 120, null: false
    t.string 'last_name', limit: 120, null: false
    t.string 'phone_number', null: false
    t.string 'email', null: false
    t.integer 'role', default: 0, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['phone_number'], name: 'index_users_on_phone_number', unique: true
  end

  add_foreign_key 'orders', 'music_records'
  add_foreign_key 'orders', 'users'
  add_foreign_key 'rentals', 'music_records'
  add_foreign_key 'rentals', 'users'
end
