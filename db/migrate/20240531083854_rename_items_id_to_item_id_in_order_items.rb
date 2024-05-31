# frozen_string_literal: true

# Fix an inconsistency with naming in order_items items_id column.
class RenameItemsIdToItemIdInOrderItems < ActiveRecord::Migration[7.1]
  def change
    rename_column :order_items, :items_id, :item_id
  end
end
