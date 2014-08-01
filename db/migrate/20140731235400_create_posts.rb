class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.timestamps
    t.string   "title"
    t.text     "body"
    t.boolean  "display"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"



    end
  end
end
