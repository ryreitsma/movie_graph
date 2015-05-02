namespace :importer do
  desc 'Import all ratings from imdb and omdb'
  task :import_ratings, [:user_name, :user_uid] => :environment do |t, args|
    Imdb::Rss::RatingsCreator.new(args.user_name, args.user_uid).perform
    Omdb::ImdbRatingsCreator.perform
  end

  desc 'Import movies and actors'
  task :import_movies, [:user_name, :user_uid] => :environment do |t, args|
    Imdb::Rss::MovieCreator.new(args.user_name, args.user_uid).perform
    Omdb::MovieLabeler.perform
    Omdb::ActedInCreator.perform
  end
end
