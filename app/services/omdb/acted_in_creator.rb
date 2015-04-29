module Omdb
  class ActedInCreator
    def perform
      Movie.all.each do |movie|
        movie_json = ApiService.get_movie_by_title(movie.title)
        #NOTE: cartoon movies do not have actors
        next unless movie_json['Actors']

        actor_names = movie_json['Actors'].split(',')
        actor_names.each do |actor_name|
          actor = Actor.find_or_create_by(name: actor_name)
          actor.acted_in << movie
        end
      end
    end
  end
end