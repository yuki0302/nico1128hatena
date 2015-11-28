class Bookmark < ActiveRecord::Base
  has_many :entry_bookmarks
  has_many :entries, through: :entry_bookmarks
end
