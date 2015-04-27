namespace :importer do
  desc 'Import all ratings from imdb and omdb'
  task import_ratings: :environment do
    Imdb::RatingsImporter.new.perform
    Omdb::RatingsImporter.new.perform
  end

  desc 'Import movies and actors'
  task import_movies: :environment do
    Imdb::MovieImporter.new.perform
    Omdb::MovieLabeler.new.perform
    Omdb::ActedInCreator.new.perform
  end
end
