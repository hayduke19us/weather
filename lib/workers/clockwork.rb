require 'clockwork'
require_relative 'forecast'

# TODO maybe make a folder with jobs in it
module Clockwork
  handler do |job, time|
    if job.eql?('frequent.forecast')
      puts "Running #{job} at #{time.to_s}"
      Worker::Forecast.perform()
    end
  end

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  every(10.seconds, 'frequent.forecast')
end
