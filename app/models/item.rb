# frozen_string_literal: true

# Item model definition.
class Item < ApplicationRecord
  belongs_to :type

  validates :name, :description, :quantity, :price, :thumbnail_url, presence: true
  validates :name, :description, length: { minimum: 1, maximum: 255 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :thumbnail_url, length: { maximum: 510 }
  validates :metadata, json_schema: true
end
