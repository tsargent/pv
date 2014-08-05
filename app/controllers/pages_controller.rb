class PagesController < ApplicationController
  def home
  	@stories = Story.published.with_photos.shuffle
  	@stories_count = Story.published.count
  	@countries_count = Story.published.pluck('country').uniq.count
  	@states_count = Story.where(country: 'US').pluck('state').uniq.compact.count
  end

  def thanks
  end
end
