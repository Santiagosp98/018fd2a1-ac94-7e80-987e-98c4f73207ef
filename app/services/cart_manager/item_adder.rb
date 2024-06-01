# frozen_string_literal: true

module CartManager
  # Add an item to a existing cart.
  class ItemAdder < ApplicationService
    # rubocop:disable Lint/MissingSuper

    def initialize(cart_id, item, quantity)
      @cart_id = cart_id
      @item = item
      @quantity = quantity
    end

    # rubocop:enable Lint/MissingSuper

    def call
      raise error unless can_add_item?

      if item_exists_in_cart?
        increment_item_quantity
      else
        add_item_to_cart
      end
    end

    private

    def error
      raise UnprocessableEntityError, 'The item cannot be added to the cart because the quantity is not available.'
    end

    def item_exists_in_cart?
      REDIS.hexists(@cart_id, @item[:id])
    end

    def add_item_to_cart
      REDIS.hmset(@cart_id, @item[:id], @quantity)
    end

    def can_add_item?
      current_quantity = item_exists_in_cart? ? REDIS.hget(@cart_id, @item[:id]).to_i : @quantity
      available_quantity = @item[:quantity] - current_quantity
      available_quantity >= 0
    end

    def increment_item_quantity
      REDIS.hincrby(@cart_id, @item[:id], @quantity)
    end
  end
end
