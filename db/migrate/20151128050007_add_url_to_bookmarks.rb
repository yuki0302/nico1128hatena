class AddUrlToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :url, :text
    add_column :bookmarks, :keyword, :string
  end
end
