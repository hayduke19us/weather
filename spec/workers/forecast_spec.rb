require 'spec_helper'
require 'workers/forecast'

describe Worker::Forecast do
  it('prints out Working and a variable of how hard') do
    assert_output(/success/) do
      Worker::Forecast.perform
    end
  end
end

