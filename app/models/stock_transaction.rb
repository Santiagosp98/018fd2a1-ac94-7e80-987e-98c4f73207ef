# frozen_string_literal: true

# StockTransaction model definition.
class StockTransaction < ApplicationRecord
  TRANSACTION_TYPES = %w[purchase sell return adjustment].freeze

  belongs_to :item
  belongs_to :order

  validates :change, :transaction_type, presence: true
  validates :change, numericality: { only_integer: true }
  validates :transaction_type, inclusion: { in: TRANSACTION_TYPES }
end
