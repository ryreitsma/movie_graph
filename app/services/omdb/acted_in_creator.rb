module Omdb
  class ActedInCreator
    def self.perform
      Movie.find_each(batch_size: 500) do |movie|
        import_actors(movie)
      end
    end

    private
    def self.import_actors(movie)
      return if movie.actors.length > 0

      begin
        movie_json = ApiService.get_movie_by_title(movie.title)
        #NOTE: cartoon movies do not have actors
        return unless movie_json['Actors']

        actor_names = movie_json['Actors'].split(',')
        actor_names.each do |actor_name|
          actor = Actor.merge(name: actor_name.strip)
          actor.acted_in << movie
        end
      rescue ApiService::MovieNotFound => e
        Rails.logger.error e.message
      end
    end
  end
end