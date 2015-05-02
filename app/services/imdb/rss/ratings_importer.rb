module Imdb
  module Rss
    class RatingsImporter < BaseImporter
      def perform
        ratings_creator = RatingsCreator.new(rss_xml: rss_xml, user_name: @user_name)
        ratings_creator.perform
      end
    end
  end
end