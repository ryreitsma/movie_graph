module Imdb
  class MovieImporter < BaseImporter
    def perform
      movie_creator = MovieCreator.new(rss_xml: rss_xml)
      movie_creator.perform
    end
  end
end