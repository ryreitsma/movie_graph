module Imdb
  module Csv
    class RatingsCreator
      def initialize(file_name, user_name)
        @file_path = Rails.root.join('csv', file_name)
        @user_name = user_name
      end

      def perform
        reviewer = Reviewer.find_or_create_by(name: @user_name)
        imdb_reviewer = Reviewer.find_or_create_by(name: 'imdb')

        CSV.foreach(@file_path, headers: true) do |row|
          movie = Movie.find_by(title: row['Title'])
          score = row[8].to_f
          imdb_score = row['IMDb Rating'].to_f

          Rating.create(from_node: reviewer, to_node: movie, score: score)
          Rating.create(from_node: imdb_reviewer, to_node: movie, score: imdb_score)
        end
      end
    end
  end
end