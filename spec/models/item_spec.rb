# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Item, type: :model do
  describe 'before creation' do
    let(:item) { Fabricate.build(:item) }
    let(:item_with_metadata) { Fabricate.build(:item_with_metadata) }
    let(:empty_item) { Item.new }
    let(:invalid_item) { Fabricate.build(:invalid_item) }
    let(:invalid_item_with_metadata) { Fabricate.build(:invalid_item_with_metadata) }

    context 'when item is valid' do
      it 'is valid without metadata' do
        expect(item).to be_valid
      end

      it 'is valid with metadata' do
        expect(item_with_metadata).to be_valid
      end
    end

    context 'when item is invalid' do
      it 'is invalid without required attributes' do
        expect(empty_item).to be_invalid
        expect_attributes_to_be_invalid(empty_item)
      end

      it 'is invalid with constraint violations' do
        expect(invalid_item).to be_invalid
        expect_attributes_to_be_invalid invalid_item
      end

      it 'is invalid with metadata schema violations' do
        expect(invalid_item_with_metadata).to be_invalid
        expect(invalid_item_with_metadata.errors).to include(:metadata)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength

def expect_attributes_to_be_invalid(item)
  errors = item.errors
  expect(errors).to include :name
  expect(errors).to include :description
  expect(errors).to include :quantity
  expect(errors).to include :price
  expect(errors).to include :thumbnail_url
end
