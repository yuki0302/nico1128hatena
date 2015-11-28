class AddUrlToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :url, :text
  end
end
