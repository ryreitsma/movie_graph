module Omdb
  class ImdbRatingsCreator
    def self.perform
      imdb_reviewer = Reviewer.find_or_create_by(name: "imdb")
      Movie.find_each(batch_size: 500) do |movie|
        import_rating(movie, imdb_reviewer)
      end
    end

    private
    def self.import_rating(movie, reviewer)
      return if reviewer.rated.first_rel_to(movie)

      begin
        movie_json = ApiService.get_movie_by_title(movie.title)
        score = movie_json['imdbRating'].to_f

        Rating.create(from_node: reviewer, to_node: movie, score: score)
      rescue ApiService::MovieNotFound => e
        Rails.logger.error e.message
      end
    end
  end
end