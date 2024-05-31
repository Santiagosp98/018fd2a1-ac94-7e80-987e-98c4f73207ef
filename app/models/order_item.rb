# frozen_string_literal: true

# OrderItem model definition.
class OrderItem < ApplicationRecord
  belongs_to :item, optional: false
  belongs_to :order, optional: false

  validates :quantity, :unit_price, presence: true
  validates :quantity, numericality: { greater_than: 0, integer_only: true }
  validates :unit_price, numericality: { greater_than_or_equal_to: 0 }
end
