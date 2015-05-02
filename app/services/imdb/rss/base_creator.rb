module Imdb
  module Rss
    class BaseCreator
      def initialize(rss_xml:)
        @rss_xml = rss_xml
      end

      def movie_xml_elements(&block)
        @rss_xml.xpath('//item').each(&block)
      end

      def extract_movie_title(movie_xml_element)
        movie_xml_element.xpath('title')[0].inner_text.gsub(/.\(\d{4}.*\)/, '')
      end
    end
  end
end