# frozen_string_literal: true

module Fabricators
  module TypeFabricator
    Fabricator(:type) do
      name { Faker::Commerce.department }
    end

    Fabricator(:settings) do
      fields do
        Array.new(Faker::Number.between(from: 1, to: 5)) do
          {
            'name' => Faker::Lorem.unique.word,
            'type' => %w[string integer boolean].sample,
            'required' => Faker::Boolean.boolean
          }
        end
      end
    end

    Fabricator(:type_with_settings, from: :type) do
      settings { Support::Helpers::Json.generate_settings }
    end

    Fabricator(:type_with_invalid_settings_schema, from: :type) do
      settings do
        {
          Faker::Lorem.word => Faker::Internet.password,
          Faker::Lorem.word => {
            Faker::Color.color_name => Faker::Science.element
          }
        }.merge(Support::Helpers::Json.generate_settings)
      end
    end
  end

end

