# frozen_string_literal: true

# Table to track the stock transactions.
class CreateStockTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :stock_transactions do |t|
      t.references :items, null: false, foreign_key: true, index: false
      t.references :orders, null: false, foreign_key: true, index: false
      t.integer :change, null: false
      t.string :transaction_type, null: false
      t.timestamps
    end

    transaction_types = %w[purchase sale return adjustment].join("', '")
    add_check_constraint :stock_transactions, "transaction_type IN ('#{transaction_types}')"
  end
end
