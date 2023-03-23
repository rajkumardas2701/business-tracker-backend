require 'redis'

redis_host = ENV["REDIS_HOST"]
redis_port = ENV["REDIS_PORT"]
redis_password = ENV["REDIS_ACCESS_KEY"]

redis = Redis.new(
  host: redis_host,
  port: redis_port,
  passowrd: redis_password,
  ssl: false,
  reconnect_attempts: 5,
  reconnect_delay: 1
)

Redis.current = redis
