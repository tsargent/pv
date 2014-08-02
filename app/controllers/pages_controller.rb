class PagesController < ApplicationController
  def home
  	@stories = Story.published.with_photos.shuffle
  end

  def thanks
  end
end
