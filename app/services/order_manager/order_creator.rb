# frozen_string_literal: true

module OrderManager
  # Creates an order from a existing cart.
  class OrderCreator < ApplicationService
    # rubocop:disable Lint/MissingSuper

    def initialize(cart, items)
      @cart = cart
      @items = items
    end

    # rubocop:enable Lint/MissingSuper

    def call
      order
    end

    private

    def order
      Order.create(order_items:, total_amount:, date: DateTime.now, status: 'pending')
    end

    def total_amount
      @items.sum { |item| item[:price] * quantity(item) }
    end

    def order_items
      @items.map do |item|
        OrderItem.new(item:, quantity: quantity(item), unit_price: item[:price])
      end
    end

    def quantity(item)
      @cart[item[:id].to_s.to_sym].to_i
    end
  end
end