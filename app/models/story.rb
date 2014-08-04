class Story < ActiveRecord::Base

  attr_accessor :email_confirmation

  validates :email, :confirmation =>true
  validates :email_confirmation, :presence =>true

  validates :original, :presence => true

  has_attached_file :photo, {
		:path => "stories/:id/:style/:filename",
		:storage => :s3, 
		:s3_credentials => Proc.new{|a| a.instance.s3_credentials },
		:styles => { 
			:thumb => "100x100#",
			:small => "200x140#"
		}
	}

	scope :published, -> { where(display: true) }
	scope :with_photos, -> { where("photo_file_name IS NOT NULL") }

	def s3_credentials
    	{:bucket => ENV['AWS_BUCKET'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  	end

  	def next
		Story.published.where("created_at > ?", self.created_at).order("created_at").first
  	end

  	def prev
		Story.published.where("created_at < ?", self.created_at).order("created_at DESC").first
  	end


end
