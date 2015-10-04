require 'spec_helper'
require 'workers/forecast'

describe Worker::Forecast do
  before do
    @stub_url = Mediators::GetWeather.new({}).request_url 
  end

  it('prints out Working and a variable of how hard') do
    stub_request(:get, @stub_url).
      to_return(status: 200, body: '{}')

    count = Weather.count
    Worker::Forecast.perform
    assert count < Weather.count
  end
end
  
