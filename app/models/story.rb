class Story < ActiveRecord::Base

	attr_accessor :email_confirmation

  	has_attached_file :photo, {
  		:path => "stories/:id/:style/:filename",
  		:styles => { 
  			:thumb => "100x100#",
  			:small => "200x140#"
  		}
  	}.merge(PAPERCLIP_STORAGE_OPTIONS)

	scope :published, -> { where(display: true) }
	scope :with_photos, -> { where("photo_file_name IS NOT NULL") }

end
