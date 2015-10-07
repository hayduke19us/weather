require "spec_helper"

describe Mediators::CreateWeather do
  before do
    @stub_url = Mediators::GetWeather.new({}).request_url
  end

  it 'creates a new weather record with json object' do
    stub_request(:get, @stub_url).
      to_return body: File.open('./spec/weather.json', 'r').read

    before  = Weather.all.count
    weather = Mediators::CreateWeather.call
    after   = Weather.all.count

    current_weather = JSON.parse weather.current
    assert_equal 45.52, current_weather['latitude']

    assert before < after


  end
end
