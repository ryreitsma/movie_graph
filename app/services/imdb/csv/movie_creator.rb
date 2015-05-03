module Imdb
  module Csv
    class MovieCreator
      def initialize(file_name)
        @file_path = Rails.root.join('csv', file_name)
      end

      def perform
        CSV.foreach(@file_path, headers: true) do |row|
          Movie.merge(title: row['Title'])
        end
      end
    end
  end
end