module Imdb
  module Rss
    class BaseCreator
      def initialize(user_name, user_uid)
        @user_name = user_name
        @user_uid = user_uid
      end

      def movie_xml_elements(&block)
        rss_xml.xpath('//item').each(&block)
      end

      def extract_movie_title(movie_xml_element)
        movie_xml_element.xpath('title')[0].inner_text.gsub(/.\(\d{4}.*\)/, '')
      end

      def rss_xml
        @rss_xml ||= RatingsDownloadService.perform(@user_uid)
      end
    end
  end
end