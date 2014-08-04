module ApplicationHelper

	def circle_hands_thumb(story)
		image_tag(story.photo.url(:thumb), { class: 'img-circle circle-hands-thumb' }) if !story.photo.blank?
	end

	def circle_hands_thumb_link(story)
		link_to(circle_hands_thumb(story), story) if !story.photo.blank?
	end

	def excerpt_location(story)
		if story.state
			"#{story.state_full}, #{story.country_full}"
		else
			"#{story.country_full}"
		end
	end

	def only_us_and_canada
  		Carmen::Country.all.select{|c| %w{US CA}.include?(c.code)}
	end

	def link_next(story)
		if story.next 
			link_to(story.next, html_options = {}) do
  				icon('chevron-circle-right') + ' Next Story' 
			end
		end
	end




	def link_prev(story)
		if story.prev
			link_to(story.prev, html_options = {}) do
  				icon('chevron-circle-left') + ' Prev Story'
			end
		end
	end

end
