class StoriesController < ApplicationController
  def index
  	@stories = Story.published
  end

  def new
  	@story = Story.new
  	@examples = Story.published.with_photos.sample(3)
  end


  def show
  	@story = Story.find(params[:id])
  end


  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to thanks_path, notice: 'Story was successfully submitted.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def story_foo
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:original)
    end

  
end
