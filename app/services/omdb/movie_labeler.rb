module Omdb
  class MovieLabeler
    def self.perform
      Movie.all.each do |movie|
        add_labels_to_movie(movie)
      end
    end

    private
    def self.add_labels_to_movie(movie)
      return if movie.year

      begin
        movie_json = ApiService.get_movie_by_title(movie.title)
        movie.year = movie_json['Year']
        movie.poster = movie_json['Poster']
        movie.genre = movie_json['Genre'].split(',')
        movie.save
      rescue ApiService::MovieNotFound => e
        Rails.logger.error e.message
      end
    end
  end
end