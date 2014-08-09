class AddCaptionToPost < ActiveRecord::Migration
  def change
    add_column :posts, :photo_caption, :text
  end
end
