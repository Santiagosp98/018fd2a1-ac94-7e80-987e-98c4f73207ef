# frozen_string_literal: true

# Items, will be referenced in 'order_items' and 'stock_transactions' table.
class CreateItems < ActiveRecord::Migration[7.1]
  # rubocop:disable Metrics/MethodLength
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.references :types, null: false, foreign_key: true, index: false
      t.string :description, null: false
      t.integer :quantity, null: false
      t.numeric :price, null: false, precision: 19, scale: 4
      t.text :thumbnail_url, null: false
      t.jsonb :metadata, null: true
      t.timestamps
    end

    add_check_constraint :items, 'quantity > 0'
  end
  # rubocop:enable Metrics/MethodLength
end
