require 'redis'

redis_host: ENV.fetch('REDIS_HOST')
redis_port: ENV.fetch('REDIS_PORT')
redis_password: ENV.fetch('REDIS_ACCESS_KEY')

redis = Redis.new(
  host: redis_host,
  port: redis_port,
  passowrd: redis_password,
  ssl: false,
  reconnect_attempts: 5,
  reconnect_delay: 1
)

Redis.current = redis
