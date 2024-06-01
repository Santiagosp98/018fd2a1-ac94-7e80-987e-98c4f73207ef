# frozen_string_literal: true

module CartManager
  # Creates the cart hash in redis.
  class CartCreator < ApplicationService
    def call
      uuid = Digest::UUID.uuid_v4
      REDIS.hset(uuid, 'id', uuid)
      uuid
    end
  end
end
