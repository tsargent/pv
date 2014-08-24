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

	def story_location(story)
		if story.full_sub_region
			raw "#{story.full_sub_region},<br/> #{story.full_region}"
		else
			"#{story.full_region}"
		end

	end

	def only_us_and_canada
  		Carmen::Country.all.select{|c| %w{US CA}.include?(c.code)}
	end

	def link_next(story)
		if story.next 
			link_to(story.next, html_options = {}) do
  				icon('angle-right') + ' Next Story' 
			end
		end
	end


	def link_prev(story)
		if story.prev
			link_to(story.prev, html_options = {}) do
  				icon('angle-left') + ' Prev Story'
			end
		end
	end

	def link_next_post(post)
		if post.next 
			link_to(post.next, html_options = {}) do
  				icon('angle-right') + ' Next Post' 
			end
		end
	end


	def link_prev_post(post)
		if post.prev
			link_to(post.prev, html_options = {}) do
  				icon('angle-left') + ' Prev Post'
			end
		end
	end

	def format_date(date)
		date.strftime("%b %d, %Y")
	end



end
