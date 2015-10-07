require 'sidekiq'

module Workers
  class Forecast
    include Sidekiq::Worker

    def self.perform
      weather = Mediators::CreateWeather.call

      if weather
        msg = "Weather record #{weather.id} created at #{weather.created_at}"
        print_message msg.colorize(:green)
      else
        msg = "There was an error requesting weather from forecast"
        print_message msg.colorize(:red)
      end

    end

    def self.print_message msg
      puts msg
    end
  end
end
