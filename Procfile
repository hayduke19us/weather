web: bundle exec puma --config config/puma.rb config.ru
console: bundle exec bin/console
worker: bundle exec sidekiq -r './config/initializers/sidekiq.rb'
clock: bundle exec clockwork ./lib/clock.rb
