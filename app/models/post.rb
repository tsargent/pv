class Post < ActiveRecord::Base



  has_attached_file :photo, {
		:path => "posts/:id/:style/:filename",
		:storage => :s3,
		:s3_credentials => Proc.new{|a| a.instance.s3_credentials },
		:styles => {
			:thumb => "100x100#",
			:medium => "1200x1200>"
		}
	}
  validates_attachment :photo, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }




	scope :published, -> { where(display: true) }


	def s3_credentials
    	{:bucket => ENV['AWS_BUCKET'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  	end

  	def next
		Post.published.where("created_at > ?", self.created_at).order("created_at").first
  	end

  	def prev
		Post.published.where("created_at < ?", self.created_at).order("created_at DESC").first
  	end

end
