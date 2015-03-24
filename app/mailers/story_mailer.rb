class StoryMailer < ActionMailer::Base
  default from: "info@projectvoice.org"






  def new_submission(story)
  	@story = story

    mail(
      :subject => 'Hello from Postmark',
      :to  => 'tsargent@gmail.com',
      :from => 'tyler@tylertylertyler.com',
      :html_body => '<strong>Hello</strong> dear Postmark user. from new_submission',
      :track_opens => 'true')


  end

  def thank_you(story)
  	@story = story

    mail(
      :subject => 'Hello from Postmark',
      :to  => 'tsargent@gmail.com',
      :from => 'tyler@tylertylertyler.com',
      :html_body => '<strong>Hello</strong> dear Postmark user. from thank_you',
      :track_opens => 'true')


  end


end
