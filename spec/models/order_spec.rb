# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'before creation' do
    context 'when order is valid' do
      let(:order) { Fabricate.build(:order) }

      it 'should be valid' do
        expect(order).to be_valid
      end
    end

    context 'when order is not valid' do
      let(:invalid_order) { Fabricate.build(:invalid_order) }

      it 'should be invalid' do
        expect(invalid_order).to be_invalid
        errors = invalid_order.errors

        expect(errors).to include(:date)
        expect(errors).to include(:total_amount)
        expect(errors).to include(:status)
      end
    end
  end
end
