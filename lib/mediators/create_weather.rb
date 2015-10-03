class Mediators::CreateWeather < Mediators::Base
  def self.call
    response = Mediators::GetWeather.run()
    Weather.create(current: MultiJson.encode(current: response))
  end
end
