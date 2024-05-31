# frozen_string_literal: true

module Fabricators
  module OrderFabricator
    Fabricator(:order) do
      date { Faker::Date.forward }
      total_amount { Faker::Commerce.price }
      status { Order::STATUSES.sample }
    end

    Fabricator(:invalid_order, from: :order) do
      date { Faker::Date.backward }
      total_amount { Faker::Number.negative }
      status { Faker::Lorem.word }
    end
  end
end
