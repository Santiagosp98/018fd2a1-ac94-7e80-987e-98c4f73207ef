# frozen_string_literal: true

module Support
  module Helpers
    module Json
      def self.generate_settings
        {
          fields: Array.new(Faker::Number.between(from: 1, to: 5)) do
            {
              key: Faker::Lorem.unique.word,
              type: %w[boolean integer string].sample,
              required: Faker::Boolean.boolean
            }
          end
        }
      end

      def self.generate_metadata
        {
          fields: Array.new(Faker::Number.between(from: 1, to: 5)) do
            {
              key: Faker::Lorem.unique.word,
              value: Faker::Lorem.paragraph(sentence_count: 3)
            }
          end
        }
      end
    end
  end
end
