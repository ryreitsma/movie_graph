module Omdb
  class ApiService
    class MovieNotFound < StandardError;end
    class UnexpectedApiResponse < StandardError;end

    include HTTParty
    base_uri 'http://www.omdbapi.com/'

    def self.perform(query_params: {})
      get('', {query: query_params})
    end

    def self.get_movie_by_title(movie_title)
      begin
        response = perform(query_params: {t: movie_title})
        validate_response(response, movie_title)
        response
      rescue HTTParty::Error => e
        Rails.logger.info "Omdb ApiService failed to get movie #{movie_title}. An HTTP error occurred: #{e.inspect}"
        raise
      end
    end

    private
    def self.validate_response(response, movie_title)
      if response.code == 200 && response['Response'] == 'False'
        raise MovieNotFound, "Movie with title #{movie_title} could not be found in the Omdb API"
      elsif response.code != 200
        raise UnexpectedApiResponse "Omdb ApiService received an unexpected response status with code #{response.code} when searching movie with title #{movie_title}"
      end
    end
  end
end