class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

	protect_from_forgery with: :exception

	before_filter :get_recent_stories


  if Rails.env.staging?
      http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']
  end

  def search

    q = URI.escape(params[:q])
    start = params[:start] || 1
    url = "https://www.googleapis.com/customsearch/v1?key=#{ENV['GOOGLE_SEARCH_KEY']}&cx=#{ENV['GOOGLE_SEARCH_ID']}&q=#{q}&start=#{start}"

    http = Curl.get(url)
    body_str = http.body_str
    json_body = JSON.parse(body_str)

    @queries = json_body['queries']
    @request = json_body['queries']['request'][0]
    @totalResults = @request['totalResults']
    @count = @request['count']
    @startIndex = @request['startIndex']
    @endIndex = @startIndex + @count - 1
    @items = json_body['items']


    if(@queries['previousPage'])
      previousPageStart = @queries['previousPage'][0]['startIndex']
      @previousPage = params.slice(:utf, :q).merge(start: previousPageStart)
    end

    if(@queries['nextPage'])
      nextPageStart = @queries['nextPage'][0]['startIndex']
      @nextPage = params.slice(:utf, :q).merge(start: nextPageStart)
    end


    render 'shared/search'

  end

	def get_recent_stories
  		@recent_stories = Story.recent
	end

end
