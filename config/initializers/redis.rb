# frozen_string_literal: true

REDIS = Redis.new(host: ENV.fetch('REDIS_HOST'), port: ENV.fetch('REDIS_PORT'), db: ENV.fetch('REDIS_DB'))
