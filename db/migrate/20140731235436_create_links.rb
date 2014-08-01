class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|

      t.timestamps


    t.string   "name"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"



    end
  end
end
