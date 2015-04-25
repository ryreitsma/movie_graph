module Imdb
  class MovieCreator < BaseCreator
    def perform
      movie_xml_elements do |movie_xml_element|
        Movie.find_or_create_by(title: extract_movie_title(movie_xml_element))
      end
    end
  end
end