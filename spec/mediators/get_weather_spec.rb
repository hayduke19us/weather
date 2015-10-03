require "spec_helper"

describe Mediators::GetWeather do
  it "returns a json hash from forecast.io" do
    weather = Mediators::GetWeather.new({})

    stub_request(:get, "#{weather.request_url}").
      to_return body: File.open('./spec/weather.json', 'r').read

    weather.request
    response = JSON.parse weather.response
    latlong = [response["latitude"], response["longitude"]]
    assert_equal latlong, weather.latlong
  end
end
