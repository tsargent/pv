class Post < ActiveRecord::Base


	scope :published, -> { where(display: true) }

end
