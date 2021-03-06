module Imdb
  module Rss
    class RatingsCreator < BaseCreator
      def perform
        reviewer = Reviewer.find_or_create_by(name: @user_name)

        movie_xml_elements do |movie_xml_element|
          movie = Movie.find_by(title: extract_movie_title(movie_xml_element))
          score = extract_score(movie_xml_element)

          Rating.create(from_node: reviewer, to_node: movie, score: score)
        end
      end

      def extract_score(movie_xml_element)
        movie_xml_element.xpath('description')[0].inner_text.match(/\d/)[0].to_f
      end
    end
  end
end