# frozen_string_literal: true

# Correct inconsistent naming in the foreign key.
class RenameTypesIdToTypeId < ActiveRecord::Migration[7.1]
  def change
    rename_column :items, :types_id, :type_id
  end
end
