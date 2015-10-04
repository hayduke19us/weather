require 'clockwork'

# TODO maybe make a folder with jobs in it
module Clockwork
  handler do |job, time|
    if job.eql?('frequent.forecast')
      puts "Running #{job} at #{time.to_s}"
    end
  end

  every(1.hour, 'frequent.forecast')
end
