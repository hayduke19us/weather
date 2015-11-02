# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
# We are stubbing all request with webmock, and are storing mocked json
# responses in files titles by there table name like spec/weather.json

ENV["RACK_ENV"] = "test"

require "bundler"
Bundler.require(:default, :test)

require 'webmock/rspec'

# setting ENV["CI"] configures simplecov for continuous integration output
# setting ENV["COVERAGE"] generates a report when running tests locally
if ENV["COVERAGE"] || ENV["CI"]
  require "simplecov"
  if ENV["CI"]
    SimpleCov.formatter = SimpleCov::Formatter::SimpleFormatter
    SimpleCov.at_exit do
      puts SimpleCov.result.format!
    end
  end
  SimpleCov.start do
    # without this the simple formatter won't do anything
    add_group "lib", "lib"
  end
end

require 'dotenv'
Dotenv.load('.env.test')

# pull in all the modesls, mediators etc.
require_relative "../lib/initializer"

# pull in test initializers
Pliny::Utils.require_glob("#{Config.root}/spec/support/**/*.rb")

RSpec.configure do |config|
  config.before :suite do
    sequel = Sequel.connect ENV['DATABASE_URL']
    DatabaseCleaner[:sequel, connection: sequel]
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end


  config.before :all do
    load 'db/seeds.rb' if File.exist? 'db/seeds.rb'
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

  config.include AssertDifference
  config.expect_with :minitest
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # the rack app to be tested with rack-test:
  def app
    @rack_app || fail("Missing @rack_app")
  end
end
