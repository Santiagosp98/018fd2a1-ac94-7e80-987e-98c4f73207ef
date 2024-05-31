# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  describe 'before creation' do
    context 'when order_item is valid' do
      let(:order_item) { Fabricate.build(:order_item) }

      it 'should be valid' do
        expect(order_item).to be_valid
      end
    end

    context 'when order_item is invalid' do
      let(:invalid_order_item) { Fabricate.build(:invalid_order_item) }

      it 'should be invalid' do
        expect(invalid_order_item).to be_invalid

        errors = invalid_order_item.errors

        expect(errors).to include :order
        expect(errors).to include :item
        expect(errors).to include :quantity
        expect(errors).to include :unit_price
      end
    end
  end
end
