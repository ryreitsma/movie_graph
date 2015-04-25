module Omdb
  class RatingsImporter
    def perform
      ImdbRatingsCreator.new.perform
    end
  end
end