module Imdb
  module Rss
    class MovieCreator < BaseCreator
      def perform
        movie_xml_elements do |movie_xml_element|
          Movie.merge(title: extract_movie_title(movie_xml_element))
        end
      end
    end
  end
end