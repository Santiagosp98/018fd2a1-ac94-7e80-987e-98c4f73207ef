# frozen_string_literal: true

module CartManager
  # 'Removes' an item from an existing cart by decreasing it's store quantity.
  # If the quantity decreases to less than one, the item will be removed from the hash.
  class ItemRemover < ApplicationService
    # rubocop:disable Lint/MissingSuper

    def initialize(cart_id, item, quantity)
      @cart_id = cart_id
      @item = item
      @quantity = quantity
    end

    # rubocop:enable Lint/MissingSuper

    def call
      raise error if current_quantity.nil?

      if @quantity < current_quantity
        remaining = REDIS.hincrby(@cart_id, @item[:id], -@quantity)
        remove_item if remaining <= 0
      else
        remove_item
      end
    end

    private

    def current_quantity
      quantity = REDIS.hget(@cart_id, @item[:id])
      quantity&.to_i
    end

    def remove_item
      REDIS.hdel(@cart_id, @item[:id])
    end

    def error
      raise UnprocessableEntityError, 'Failed to remove item from the cart.'
    end
  end
end
