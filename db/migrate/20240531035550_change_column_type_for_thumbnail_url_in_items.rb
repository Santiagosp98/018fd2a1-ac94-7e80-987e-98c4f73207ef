# frozen_string_literal: true

# The text is too lengthy to store in a URL. Doubling the size of the varchar should be sufficient.
class ChangeColumnTypeForThumbnailUrlInItems < ActiveRecord::Migration[7.1]
  def up
    change_column :items, :thumbnail_url, :string, limit: 510
  end

  def down
    change_column :items, :thumbnail_url, :text
  end
end
