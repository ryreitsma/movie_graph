module Omdb
  class ApiService
    include HTTParty
    base_uri 'http://www.omdbapi.com/'

    def initialize(query_params: {})
      @query_params = {query: query_params}
    end

    def perform
      self.class.get('', @query_params)
    end
  end
end