class EntryBookmark < ActiveRecord::Base
	belongs_to :entry
	belongs_to :bookmark
end
