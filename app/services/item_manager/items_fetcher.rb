# frozen_string_literal: true

module ItemManager
  # Fetch multiple items by id.
  class ItemsFetcher < ApplicationService
    # rubocop:disable Lint/MissingSuper

    def initialize(ids)
      @ids = ids
    end

    # rubocop:enable Lint/MissingSuper

    def call
      fetch_items
    end

    private

    def fetch_items
      Item.where(id: @ids)
    end
  end
end
