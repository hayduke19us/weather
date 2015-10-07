require 'clockwork'
require_relative 'application'


module Clockwork
  handler do |job, time|
    if job.eql?('frequent.forecast')
      puts "Running #{job} at #{time.to_s}"
      Workers::Forecast.perform
    end
  end

  a = AppEnv.new
  every(1.hour, 'frequent.forecast') if a.pro?
end
