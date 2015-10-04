require 'sidekiq'
require 'colorize'

module Worker
  class Forecast
    include Sidekiq::Worker

    def self.perform
      weather = Mediators::CreateWeather.call
      if weather
        human_time = Proc.new {|time| time.strftime("%a, %b, %d, %Y %H:%M %p")} 
        msg = %[
                   Weather record #{weather.id} \n 
                   created on #{human_time.call(weather.created_at)}
                ]

        puts msg.colorize(:green)
      else
        msg = "There was an error requesting weather from forecast".colorize(:red)
        puts msg.colorize(:red)
      end
    end
  end
end
