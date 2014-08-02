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


end
