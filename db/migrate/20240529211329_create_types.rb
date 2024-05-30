# frozen_string_literal: true

# Item types, will be referenced in 'items' table.
class CreateTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :types do |t|
      t.string :name, null: false
      t.jsonb :settings, null: true
      t.timestamps
    end
  end
end
