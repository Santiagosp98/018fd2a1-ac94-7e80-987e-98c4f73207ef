# frozen_string_literal: true

# Migration for order_items table.
class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.references :items, null: false, foreign_key: true, index: false
      t.references :order, null: false, foreign_key: true, index: false
      t.integer :quantity, null: false
      t.numeric :unit_price, null: false, precision: 19, scale: 4
      t.timestamps
    end

    add_check_constraint :order_items, 'quantity > 0'
  end
end
