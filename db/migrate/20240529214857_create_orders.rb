# frozen_string_literal: true

# Orders table. Will be referenced in order_items and stock_transactions.
class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.datetime :date, null: false
      t.numeric :total_amount, null: false, precision: 19, scale: 4
      t.string :status, null: false
      t.timestamps
    end

    valid_statuses = %w[pending paid shipped delivered cancelled].join("', '")
    add_check_constraint :orders, "status IN ('#{valid_statuses}')"
  end
end
