class StoryMailer < ActionMailer::Base
  default from: "info@projectvoice.org"


  def new_submission(story)
  	@story = story
    mail(to: 'info@projectvoice.org', subject: 'New Story Submitted')
  end

  def thank_you(story)
  	@story = story
    mail(to: story.email, subject: 'Thank you for your story')
  end


end
