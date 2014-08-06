class Admin::StoriesController < AdminController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  # GET /storys
  # GET /storys.json
  def index
    @stories = Story.order('created_at DESC')
  end

  # GET /storys/1
  # GET /storys/1.json
  def show
  end

  # GET /storys/new
  def new
    @story = Story.new
  end

  # GET /storys/1/edit
  def edit
  end

  # POST /storys
  # POST /storys.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to [:admin, @story], notice: 'story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storys/1
  # PATCH/PUT /storys/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to [:admin, @story], notice: 'story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storys/1
  # DELETE /storys/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to admin_storys_url, notice: 'story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:excerpt)
    end
end
