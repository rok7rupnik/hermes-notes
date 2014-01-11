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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140109093411) do

  create_table "posta", force: true do |t|
    t.integer  "postnaSt"
    t.string   "naziv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "postavkas", force: true do |t|
    t.integer  "zaporednaSt"
    t.integer  "kolicina"
    t.float    "popust"
    t.integer  "racun_id"
    t.integer  "storitev_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postavkas", ["racun_id"], name: "index_postavkas_on_racun_id", using: :btree
  add_index "postavkas", ["storitev_id"], name: "index_postavkas_on_storitev_id", using: :btree

  create_table "racuns", force: true do |t|
    t.date     "datum"
    t.float    "znesek"
    t.integer  "uporabnik_id"
    t.integer  "stranka_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "racuns", ["stranka_id"], name: "index_racuns_on_stranka_id", using: :btree
  add_index "racuns", ["uporabnik_id"], name: "index_racuns_on_uporabnik_id", using: :btree

  create_table "storitevs", force: true do |t|
    t.integer  "skupnaKolicina"
    t.float    "cenaNaKos"
    t.string   "opis"
    t.integer  "uporabnik_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "storitevs", ["uporabnik_id"], name: "index_storitevs_on_uporabnik_id", using: :btree

  create_table "strankas", force: true do |t|
    t.string   "ime"
    t.string   "priimek"
    t.string   "nazivPodjetja"
    t.string   "naslov"
    t.string   "email"
    t.string   "telefon"
    t.string   "davcna"
    t.string   "trr"
    t.boolean  "ddv"
    t.integer  "posta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "strankas", ["posta_id"], name: "index_strankas_on_posta_id", using: :btree

  create_table "stroseks", force: true do |t|
    t.date     "datum"
    t.float    "znesek"
    t.string   "opis"
    t.integer  "uporabnik_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stroseks", ["uporabnik_id"], name: "index_stroseks_on_uporabnik_id", using: :btree

  create_table "uporabniks", force: true do |t|
    t.string   "ime"
    t.string   "priimek"
    t.string   "nazivPodjetja"
    t.string   "naslov"
    t.string   "email"
    t.string   "telefon"
    t.string   "davcna"
    t.string   "trr"
    t.boolean  "ddv"
    t.integer  "posta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "uporabniks", ["email"], name: "index_uporabniks_on_email", unique: true, using: :btree
  add_index "uporabniks", ["posta_id"], name: "index_uporabniks_on_posta_id", using: :btree
  add_index "uporabniks", ["remember_token"], name: "index_uporabniks_on_remember_token", using: :btree

end
