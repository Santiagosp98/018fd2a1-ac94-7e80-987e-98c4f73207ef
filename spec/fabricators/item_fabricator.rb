# frozen_string_literal: true

module Fabricators
  module ItemFabricator
    Fabricator(:item) do
      name { Faker::Commerce.product_name }
      type { Fabricate.build(:type) }
      description { Faker::Lorem.paragraph }
      quantity { Faker::Number.non_zero_digit }
      price { Faker::Commerce.price }
      thumbnail_url { Faker::Avatar.image }
    end

    Fabricator(:item_with_metadata, from: :item) do
      metadata { Support::Helpers::Json.generate_metadata }
    end

    Fabricator(:invalid_item, from: :item) do
      name { Faker::Lorem.characters number: 256 }
      description { Faker::Lorem.characters number: 256 }
      quantity { Faker::Number.negative }
      price { Faker::Number.negative }
      thumbnail_url { Faker::Lorem.characters number: 600 }
    end

    Fabricator(:invalid_item_with_metadata, from: :invalid_item) do
      metadata { Support::Helpers::Json.generate_metadata.delete(:fields) }
    end
  end
end
