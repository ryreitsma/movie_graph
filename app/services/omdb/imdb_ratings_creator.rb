module Omdb
  class ImdbRatingsCreator
    def perform
      imdb_reviewer = Reviewer.find_or_create_by(name: "imdb")
      Movie.all.each do |movie|
        import_rating(movie, imdb_reviewer)
      end
    end

    private
    def import_rating(movie, reviewer)
      return if reviewer.rated.first_rel_to(movie)

      begin
        movie_json = ApiService.get_movie_by_title(movie.title)
        score = movie_json['imdbRating'].to_d.round

        Rating.create(from_node: reviewer, to_node: movie, score: score)
      rescue ApiService::MovieNotFound => e
        Rails.logger.error e.message
      end
    end
  end
end