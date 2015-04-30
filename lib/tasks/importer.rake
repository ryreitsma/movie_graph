namespace :importer do
  desc 'Import all ratings from imdb and omdb'
  task :import_ratings, [:user_name, :user_uid] => :environment do |t, args|
    Imdb::RatingsImporter.new(args.user_name, args.user_uid).perform
    Omdb::RatingsImporter.new.perform
  end

  desc 'Import movies and actors'
  task :import_movies, [:user_name, :user_uid] => :environment do |t, args|
    Imdb::MovieImporter.new(args.user_name, args.user_uid).perform
    Omdb::MovieLabeler.new.perform
    Omdb::ActedInCreator.new.perform
  end
end
