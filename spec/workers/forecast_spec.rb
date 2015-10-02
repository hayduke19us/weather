require 'spec_helper'
require 'workers/forecast'

describe Worker::Forecast do
  it('prints out Working and a variable of how hard') do
    assert_output(/Workin/) do
      Worker::Forecast.perform('so so hard', 2)
    end
  end
end
  
