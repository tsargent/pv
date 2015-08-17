class StoriesController < ApplicationController

  before_action :get_three_hands, only: [:new, :create]

  def index
  	@stories = Story.published.order('created_at DESC').page(params[:page])
  end

  def new
  	@story = Story.new
  	@examples = Story.published.with_photos.sample(3)
  end


  def show
    @story = Story.find(params[:id])
    @page_title = "Project Voice | #{@story.excerpt}"
    if(!@story.display) 
      redirect_to stories_path
    end
  end


  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        StoryMailer.new_submission(@story).deliver
        StoryMailer.thank_you(@story).deliver
        format.html { redirect_to thanks_path, notice: 'Story was successfully submitted.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, template: "stories/new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end


  def subregion_options
    render partial: 'subregion_select'
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:original, :country, :state, :email, :email_confirmation, :photo)
    end

    def get_three_hands
      @examples = Story.published.with_photos.sample(3)
    end

  
end
