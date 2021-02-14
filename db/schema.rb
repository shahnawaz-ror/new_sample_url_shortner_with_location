# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_210_213_184_850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'countries', force: :cascade do |t|
    t.string 'name'
    t.string 'ip'
    t.integer 'url_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'links', force: :cascade do |t|
    t.string 'short_url'
    t.string 'long_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'shortened_urls', id: :serial, force: :cascade do |t|
    t.integer 'owner_id'
    t.string 'owner_type', limit: 20
    t.text 'url', null: false
    t.string 'unique_key', limit: 10, null: false
    t.string 'category'
    t.integer 'use_count', default: 0, null: false
    t.datetime 'expires_at'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index ['category'], name: 'index_shortened_urls_on_category'
    t.index %w[owner_id owner_type], name: 'index_shortened_urls_on_owner_id_and_owner_type'
    t.index ['unique_key'], name: 'index_shortened_urls_on_unique_key', unique: true
    t.index ['url'], name: 'index_shortened_urls_on_url'
  end

  create_table 'url_shorts', force: :cascade do |t|
    t.text 'link'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'urls', force: :cascade do |t|
    t.string 'url'
    t.string 'encoded_url'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_urls_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'urls', 'users'
end
