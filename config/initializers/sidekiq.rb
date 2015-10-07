# If your client is single-threaded,
# we just need a single connection in our Redis connection pool
Sidekiq.configure_client do |config|
  config.redis = { namespace: 'weather', size: 1, url: ENV["REDIS_PROVIDER"]}
end

# Sidekiq server is multi-threaded
# so our Redis connection pool size defaults to concurrency (-c)
Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'weather', url: ENV["REDIS_PROVIDER"]}
end

