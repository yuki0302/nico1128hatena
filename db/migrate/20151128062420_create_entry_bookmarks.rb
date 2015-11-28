class CreateEntryBookmarks < ActiveRecord::Migration
  def change
    create_table :entry_bookmarks do |t|
      t.integer :entry_id
      t.integer :bookmark_id

      t.timestamps null: false
    end
  end
end
