require_relative 'get_weather'

class Mediators::CreateWeather < Mediators::Base
  def self.call
    response = Mediators::GetWeather.run()
    parsed = JSON.parse(response)

    longitude = parsed['longitude']
    latitude  = parsed['latitude']
    current   = parsed['currently'].to_json
    hourly    = parsed['hourly'].to_json
    daily     = parsed['daily'].to_json

    Weather.create(
      current:   current,
      latitude:  latitude,
      longitude: longitude,
      hourly:    hourly,
      daily:     daily
    )
  end
end
