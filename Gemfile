source "https://rubygems.org"
ruby "2.2.3"

gem "multi_json"
gem "oj"
gem "pg"
gem "pliny", "~> 0.11"
gem "pry"
gem "puma", "~> 2.10"
gem "rack-ssl"
gem "rake"
gem "rollbar", require: "rollbar/middleware/sinatra"
gem "sequel", "~> 4.16"
gem "sequel-paranoid"
gem "sequel_pg", "~> 1.6", require: "sequel"
gem "sinatra", "~> 1.4", require: "sinatra/base"
gem "sinatra-contrib", require: ["sinatra/namespace", "sinatra/reloader"]
gem "sinatra-router"
gem "sucker_punch"
gem "sidekiq"
gem "clockwork"
gem "rest-client"
gem "colorize"
gem "haml"
gem "faye-websocket"
gem "bcrypt"

group :development, :test do
  gem "pry-byebug"
  gem "byebug"
  gem "webmock"
end

group :test do
  gem "simplecov", require: false
  gem "committee"
  gem "database_cleaner"
  gem "dotenv"
  gem "rack-test"
  gem "rspec"
  gem "assert_difference"
end
