class PagesController < ApplicationController
  def home
  	@stories = Story.published.with_photos.shuffle
  	@stories_count = Story.published.count
  	@countries_count = Story.published.pluck('country').uniq.count
  end

  def thanks
  end
end
