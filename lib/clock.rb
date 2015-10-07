require 'clockwork'

module Clockwork

  handler do |job, time|
    if job.eql?('frequent.forecast')
      puts "Running #{job} at #{time.to_s}"
    end
  end

  every(10.seconds, 'frequent.forecast')
end
