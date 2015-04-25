module Imdb
  class RssService
    include HTTParty
    base_uri 'rss.imdb.com/user/'

    parser(
      proc do |body, format|
        Nokogiri::XML(body)
      end
    )

    def path
      "/#{Config['user_uid']}/ratings"
    end

    def perform
      self.class.get(path)
    end
  end
end