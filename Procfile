web: bundle exec puma --config config/puma.rb config.ru
console: bundle exec bin/console
worker: bundle exec sidekiq -r './lib/workers/forecast.rb'
script: `redis-server`
