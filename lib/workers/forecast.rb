require 'sidekiq'
require 'colorize'

module Workers
  class Forecast
    include Sidekiq::Worker

    def self.perform
      weather = Mediators::CreateWeather.call
      if weather
        msg = "Weather record #{weather.id} created at #{weather.created_at}"
        puts msg.colorize(:green)
      else
        msg = "There was an error requesting weather from forecast".colorize(:red)
        puts msg.colorize(:red)
      end
    end
  end
end
