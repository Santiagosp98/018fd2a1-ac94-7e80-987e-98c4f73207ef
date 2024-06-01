# frozen_string_literal: true

module CartManager
  # Fetch the cart from redis.
  class CartFetcher < ApplicationService
    # rubocop:disable Lint/MissingSuper

    def initialize(uuid)
      @uuid = uuid
    end

    # rubocop:enable Lint/MissingSuper

    def call
      cart = REDIS.hgetall(@uuid)

      raise ResourceNotFoundError, 'Cart not found.' if cart.empty?

      cart.symbolize_keys
    end
  end
end
