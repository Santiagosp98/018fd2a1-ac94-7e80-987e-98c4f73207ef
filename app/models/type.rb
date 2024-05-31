# frozen_string_literal: true

# Type model definition.
class Type < ApplicationRecord
  has_many :items, dependent: :restrict_with_error

  validates :name, presence: true
  validates :settings, json_schema: true
end
