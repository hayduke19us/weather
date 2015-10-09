require "spec_helper"

describe Weather do
  it('can take a json string for the current attribute') do
    current = {rain: 'light', temp: 60, overview: 'cloudy'}
    weather = Weather.create(current: current.to_json)
    current_weather = JSON.parse weather.current
    assert_equal current_weather['rain'], 'light'
  end
end
