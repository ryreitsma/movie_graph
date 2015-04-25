module Imdb
  class BaseImporter
    def rss_xml
      RssService.new.perform
    end
  end
end