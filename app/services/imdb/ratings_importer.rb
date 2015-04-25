module Imdb
  class RatingsImporter < BaseImporter
    def perform
      ratings_creator = RatingsCreator.new(rss_xml: rss_xml)
      ratings_creator.perform
    end
  end
end