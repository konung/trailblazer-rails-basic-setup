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

ActiveRecord::Schema.define(version: 20170315173638) do

  create_table "albums", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.integer "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["title"], name: "index_albums_on_title"
  end

  create_table "artists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "full_name", null: false
    t.string "country", limit: 2, default: "US", null: false
    t.integer "sales_cents", default: 0, null: false
    t.boolean "signed_with_label", default: false
    t.integer "billboard_position"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billboard_position"], name: "index_artists_on_billboard_position"
    t.index ["country"], name: "index_artists_on_country"
    t.index ["full_name"], name: "index_artists_on_full_name"
    t.index ["sales_cents"], name: "index_artists_on_sales_cents"
    t.index ["signed_with_label"], name: "index_artists_on_signed_with_label"
  end

  create_table "covers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "album_id", null: false
    t.string "image_path", limit: 765, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_covers_on_album_id"
    t.index ["image_path"], name: "index_covers_on_image_path"
  end

  create_table "songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title", null: false
    t.integer "style", limit: 1, null: false
    t.integer "album_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["album_id"], name: "index_songs_on_album_id"
    t.index ["style"], name: "index_songs_on_style"
    t.index ["title"], name: "index_songs_on_title"
  end

end
