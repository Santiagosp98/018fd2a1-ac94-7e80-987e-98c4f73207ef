# frozen_string_literal: true

module Fabricators
  module OrderItemFabricator
    Fabricator(:order_item) do
      item { Fabricate.build(:item) }
      order { Fabricate.build(:order) }
      quantity { Faker::Number.non_zero_digit }
      unit_price { Faker::Commerce.price }
    end

    Fabricator(:invalid_order_item, from: :order_item) do
      item { nil }
      order { nil }
      quantity { Faker::Number.negative }
      unit_price { Faker::Number.negative }
    end
  end
end
