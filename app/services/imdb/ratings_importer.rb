module Imdb
  class RatingsImporter
    def perform
      rss_xml = RssService.new.perform

      movie_creator = MovieCreator.new(rss_xml: rss_xml)
      movie_creator.perform

      ratings_creator = RatingsCreator.new(rss_xml: rss_xml)
      ratings_creator.perform
    end
  end
end