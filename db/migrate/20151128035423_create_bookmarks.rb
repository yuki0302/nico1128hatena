class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :image_url
      t.text :desc
      t.datetime :original_posted_at

      t.timestamps null: false
    end
  end
end
