# frozen_string_literal: true

# Fix naming inconsistency.
class RenameItemsIdToItemIdInStockTransactions < ActiveRecord::Migration[7.1]
  def change
    rename_column :stock_transactions, :items_id, :item_id
  end
end
