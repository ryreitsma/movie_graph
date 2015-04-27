module Omdb
  class MovieLabeler
    def perform
      Movie.all.each do |movie|
        movie_json = ApiService.get_movie_by_title(movie.title)
        movie.year = movie_json['Year']
        movie.poster = movie_json['Poster']
        movie.genre = movie_json['Genre'].split(',')
        movie.save
      end
    end
  end
end