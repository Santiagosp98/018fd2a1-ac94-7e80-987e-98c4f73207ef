# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StockTransaction, type: :model do
  describe 'before creation' do
    context 'when stock transaction is valid' do
      let(:stock_transaction) { Fabricate.build(:stock_transaction) }

      it 'should be valid' do
        expect(stock_transaction).to be_valid
      end
    end

    context 'when stock transaction is invalid' do
      let(:invalid_stock_transaction) { Fabricate.build(:invalid_stock_transaction) }
      it 'should be invalid' do
        expect(invalid_stock_transaction).to be_invalid

        errors = invalid_stock_transaction.errors

        expect(errors).to include(:item)
        expect(errors).to include(:order)
        expect(errors).to include(:change)
        expect(errors).to include(:transaction_type)
      end
    end
  end
end
