# frozen_string_literal: true

module ItemManager
  # Fetch an item by it's id.
  class ItemFetcher < ApplicationService
    # rubocop:disable Lint/MissingSuper

    def initialize(id)
      @id = id
    end

    # rubocop:enable Lint/MissingSuper

    def call
      find_item
    end

    private

    def find_item
      Item.find(@id)
    end
  end
end
