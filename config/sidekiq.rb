

def parse_env file
  File.exist?(file) ? Pliny::Utils.parse_env(file) : nil
end

def env type='development'

  env = lambda {
    case type
      when 'test'
        parse_env('.env.test')
      when 'development'
        parse_env('.env')
    end
  }

  ENV['PLINY_ENV'] ? ENV : env.call

end


if env['PLINY_ENV'] == 'development'
  `rake redis:kill_all`
  `rake redis:start`
end

# If your client is single-threaded,
# we just need a single connection in our Redis connection pool
Sidekiq.configure_client do |config|
  config.redis = { namespace: 'weather', size: 1, url: ENV["REDIS_URL"]}
end

# Sidekiq server is multi-threaded
# so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'weather', url: ENV["REDIS_URL"]}
end

