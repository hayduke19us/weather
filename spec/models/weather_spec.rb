require "spec_helper"

describe Weather do

  before do
    @w = Weather.create(longitude: -127.324, latitude: 44.00)
  end

  it 'needs a longitude and latitude' do
    assert @w.valid? 
  end

  it 'can take a json string for the current attribute' do
    current = {rain: 'light', temp: 60, overview: 'cloudy'}.to_json

    @w.update current: current

    current_weather = JSON.parse @w.current
    assert_equal current_weather['rain'], 'light'
  end
end
