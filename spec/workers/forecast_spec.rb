require 'spec_helper'
require 'workers/forecast'

describe Workers::Forecast do
  before do
    stub_url = Mediators::GetWeather.new({}).request_url
    url = './spec/weather.json'
    file = File.open(url, 'r').read if File.exist?(url)

    stub_request(:get, stub_url).
      to_return(status: 200, body: file)
  end

  it 'Creates a new weather record in DB' do
    assert_difference 'Weather.count', +1 do
      Workers::Forecast.perform
    end
  end

  it 'Prints an output with the time and id of weather record' do
    skip
    assert_output(/created/) do
      Workers::Forecast.perform
    end
  end

end
