class Searcher
  include HTTParty
# https://www.googleapis.com/customsearch/v1?key=#{ENV['GOOGLE_SEARCH_KEY']}&cx=#{ENV['GOOGLE_SEARCH_ID']}&q=#{q}&start=#{start}
  base_uri 'https://www.googleapis.com'
  format :json

  def initialize(q, start)
    @options = { query: {q: q, start: start, key: ENV['GOOGLE_SEARCH_KEY'], cx: ENV['GOOGLE_SEARCH_ID']}}
  end

  def response
    self.class.get("/customsearch/v1", @options)
  end

  def totalResults
    request_hash['totalResults'].to_i
  end

  def totalResultsString
    totalResults == 0 ? "No" : totalResults
  end

  def searchTerms
    request_hash['searchTerms']
  end

  def items
    self.response['items']
  end

  def nextPage?
    self.response['queries']['nextPage']
  end

  def nextStart
    request_hash['startIndex'].to_i + request_hash['count'].to_i
  end

  def previousPage?
    self.response['queries']['previousPage']
  end

  def previousStart
    request_hash['startIndex'].to_i - request_hash['count'].to_i
  end

  def errors
    self.response['error']
  end

  private

  def request_hash
    self.response['queries']['request'][0] if self.response['queries']
  end

end