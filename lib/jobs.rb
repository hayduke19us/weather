require 'workers/forecast'

job 'frequent.forecast' do
  Worker::Forecast.perform
end
