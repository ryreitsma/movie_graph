module Omdb
  class ActedInCreator
    def perform
      Movie.all.each do |movie|
        import_actors(movie)
      end
    end

    private
    def import_actors(movie)
      return if movie.actors.length > 0

      begin
        movie_json = ApiService.get_movie_by_title(movie.title)
        #NOTE: cartoon movies do not have actors
        return unless movie_json['Actors']

        actor_names = movie_json['Actors'].split(',')
        actor_names.each do |actor_name|
          actor = Actor.find_or_create_by(name: actor_name.strip)
          actor.acted_in << movie
        end
      rescue ApiService::MovieNotFound => e
        Rails.logger.error e.message
      end
    end
  end
end