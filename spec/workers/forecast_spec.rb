require 'spec_helper'
require 'workers/forecast'

describe Workers::Forecast do
  before do
    stub_url = Mediators::GetWeather.new({}).request_url

    stub_request(:get, stub_url).
      to_return(status: 200, body: File.open('../weather.json', 'r').read)
  end

  it 'Creates a new weather record in DB' do
    assert_difference 'Weather.count', +1 do
      Workers::Forecast.perform
    end
  end

  it 'Prints an output with the time and id of weather record' do
    assert_output(/created/) do
      Workers::Forecast.perform
    end
  end

end
