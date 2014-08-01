class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|

	    t.timestamps
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
  end
end
