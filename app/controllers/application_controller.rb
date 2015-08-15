class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

	protect_from_forgery with: :exception

	before_filter :get_recent_stories


    if Rails.env.staging?
        http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']
    end

  def searchOLD

    puts "\n"*10
    puts params[:q]
    page = params[:page] || 1
    @page = page
    offset = (page.to_i * 10) - 10
    @offset = offset


    # https://developers.google.com/custom-search/json-api/v1/using_rest
    # https://www.googleapis.com/customsearch/v1?key=AIzaSyCMGfdDaSfjqv5zYoS0mTJnOT3e9MURWkU&cx=001087414392295562014:0wy_6-z6tsy&q=regret

    # https://developers.google.com/custom-search/docs/xml_results#wsQueryTerms
    require 'google/api_client'
    client = Google::APIClient.new(authorization: nil)
    customsearch = client.discovered_api('customsearch','v1')
    result = client.execute(customsearch.cse.list,
      q: params[:q],
      start: 1,
      num: 10,
      cx: '001087414392295562014:0wy_6-z6tsy',
      key: 'AIzaSyCMGfdDaSfjqv5zYoS0mTJnOT3e9MURWkU'
    )


    # puts "\n"*10
    # puts "result.methods #{result.methods}"
    # puts "result.next_page #{result.next_page}"
    # puts "\n"*10
    # puts "JSON result body#{JSON.parse(result.body)}"
    # puts "\n"*10


    # puts "\n"*10


    json_body = JSON.parse(result.body)

    # puts "result.body"
    # puts result.body


    @totalResults = json_body['searchInformation']['totalResults']
    @items = json_body['items']


    # @stories = Story.all
    render 'shared/search'
  end

  def search

    q = params[:q]
    start = params[:start] || 1


    searcher = Searcher.new(q, start)


    @searcher = searcher

    render 'shared/search'




    # q = params[:q]
    # start = params[:start] || 1
    # response = HTTParty.get("https://www.googleapis.com/customsearch/v1?key=#{ENV['GOOGLE_SEARCH_KEY']}&cx=#{ENV['GOOGLE_SEARCH_ID']}&q=#{q}&start=#{start}")
    # puts "-------\n"*10
    # pp response
    # puts "-------\n"*10
    # @nextPage = response["queries"]["nextPage"]
    # @prevPage = response["queries"]["previousPage"]
    # @items = JSON.parse(response.body)["items"]

    # pp "response #{response}"
    # puts "\n"*20
    # puts "response.body #{JSON.parse(response.body)}"
    # puts "\n"*20

    # body = JSON.parse(response.body)
    # @items = body['items']
    # render nothing: true
    # render 'shared/search'

  end

	def get_recent_stories
  		@recent_stories = Story.recent
	end

end
