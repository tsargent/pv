class InitialImport < ActiveRecord::Migration
  def change



  create_table "links", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
  end

  create_table "stories", force: true do |t|
    t.string   "email"
    t.text     "original"
    t.text     "edit"
    t.text     "excerpt"
    t.string   "country"
    t.string   "state"
    t.string   "first"
    t.string   "last"
    t.integer  "age"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "old_id"
    t.boolean  "has_old_image"
    t.boolean  "new_story_tweet"
    t.boolean  "new_story_email"
    t.string   "state_full"
    t.string   "country_full"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  	
  end
end
