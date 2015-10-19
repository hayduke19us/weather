web: bundle exec puma --config config/puma.rb config.ru
worker: bundle exec sidekiq -r './config/sidekiq.rb'
clock: bundle exec clockwork ./lib/clock.rb
socket: bundle exec rake socket:start
