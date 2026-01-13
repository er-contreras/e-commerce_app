# Example if using a specific initializer
$redis = Redis.new(url: ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" })
