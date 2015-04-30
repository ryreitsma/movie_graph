module Imdb
  class RssService
    include HTTParty
    base_uri 'rss.imdb.com/user/'

    parser(
      proc do |body, format|
        Nokogiri::XML(body)
      end
    )

    def self.perform(user_uid)
      get("/#{user_uid}/ratings")
    end
  end
end