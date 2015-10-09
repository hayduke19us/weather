require "spec_helper"

describe Mediators::CreateWeather do

  before do
    stub_url = Mediators::GetWeather.new({}).request_url
    stub_request(:get, stub_url).
      to_return body: File.open('./spec/weather.json', 'r').read
    @create_weather = Proc.new { Mediators::CreateWeather.call }
  end

  it 'creates a new weather record' do
    assert_difference 'Weather.count', +1 do
      @create_weather.call
    end
  end

  it 'returns a json object with different keys' do
    weather = @create_weather.call
    assert_equal 45.52, weather.latitude
  end

end
