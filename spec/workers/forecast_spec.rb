require 'spec_helper'
require 'workers/forecast'

describe Workers::Forecast do
  before do
    @stub_url = Mediators::GetWeather.new({}).request_url 
  end

  it('Creates a new weather record in DB') do
    stub_request(:get, @stub_url).
      to_return(status: 200, body: '{}')

    count = Weather.count
    Workers::Forecast.perform
    assert count < Weather.count
  end
end
  
