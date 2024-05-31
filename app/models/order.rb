# frozen_string_literal: true

# Order model definition.
class Order < ApplicationRecord
  STATUSES = %w[pending paid shipped delivered cancelled].freeze

  validates :date, :total_amount, :status, presence: true
  validates :date, comparison: { greater_than_or_equal_to: Date.current }
  validates :total_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: STATUSES }
end
