class Entry < ActiveRecord::Base
  has_many :entry_bookmarks
  has_many :bookmarks, through: :entry_bookmarks
end
