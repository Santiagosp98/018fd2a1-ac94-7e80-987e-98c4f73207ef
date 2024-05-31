# frozen_string_literal: true

module Fabrications
  module StockTransactionFabricator
    Fabricator(:stock_transaction) do
      item { Fabricate.build(:item) }
      order { Fabricate.build(:order) }
      change { Faker::Number.non_zero_digit }
      transaction_type { StockTransaction::TRANSACTION_TYPES.sample }
    end

    Fabricator(:invalid_stock_transaction, from: :stock_transaction) do
      item { nil }
      order { nil }
      change { Faker::Lorem.word }
      transaction_type { Faker::Lorem.word }
    end
  end
end
