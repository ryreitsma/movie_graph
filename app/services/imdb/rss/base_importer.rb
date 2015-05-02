module Imdb
  module Rss
    class BaseImporter
      def initialize(user_name, user_uid)
        @user_name = user_name
        @user_uid = user_uid
      end

      def rss_xml
        RatingsDownloadService.perform(@user_uid)
      end
    end
  end
end