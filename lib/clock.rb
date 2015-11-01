require 'clockwork'
require_relative 'application'


module Clockwork
  handler do |job, time|
    if job.eql?('frequent.forecast')
      puts "Running #{job} at #{time.to_s}"
      Workers::Forecast.perform
    end
  end

  every(1.hour, 'frequent.forecast') if AppEnv.pro?
end
