namespace :importer do
  desc 'Import all ratings, movies and actors from imdb ratings rss feed'
  task :from_rss, [:user_name, :user_uid] => :environment do |t, args|
    Imdb::Rss::MovieCreator.new(args.user_name, args.user_uid).perform
    Omdb::MovieLabeler.perform
    Omdb::ActedInCreator.perform
    Imdb::Rss::RatingsCreator.new(args.user_name, args.user_uid).perform
    Omdb::ImdbRatingsCreator.perform
  end

  desc 'Import all ratings, movies and actors from imdb ratings csv file'
  task :from_csv, [:user_name, :file_name] => :environment do |t, args|
    Imdb::Csv::MovieCreator.new(args.file_name).perform
    Omdb::MovieLabeler.perform
    Omdb::ActedInCreator.perform
    Imdb::Csv::RatingsCreator.new(args.file_name, args.user_name).perform
  end
end
