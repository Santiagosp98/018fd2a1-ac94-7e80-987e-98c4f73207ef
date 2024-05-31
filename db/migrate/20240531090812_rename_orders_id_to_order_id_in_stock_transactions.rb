# frozen_string_literal: true

# Fix naming inconsistency.
class RenameOrdersIdToOrderIdInStockTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :stock_transactions, :orders_id, :order_id
  end
end
