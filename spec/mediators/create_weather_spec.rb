require "spec_helper"

describe Mediators::CreateWeather do
  before do
    @stub_url = Mediators::GetWeather.new({}).request_url
  end

  it 'creates a new weather record with the whole json object' do
    stub_request(:get, @stub_url).
      to_return body: File.open('./spec/weather.json', 'r').read

    weather = Mediators::CreateWeather.call
    parsed = JSON.parse(weather.current)
    assert_equal 45.52, JSON.parse(parsed["current"])["latitude"]
  end
end
