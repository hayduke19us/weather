require_relative 'get_weather'

class Mediators::CreateWeather < Mediators::Base
  def self.call
    response = Mediators::GetWeather.run()
    Weather.create current: response
  end
end
