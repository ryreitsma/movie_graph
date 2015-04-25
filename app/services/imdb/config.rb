module Imdb
  class Config
    def self.[](key)
      Rails.application.config_for(:imdb)[key]
    end
  end
end