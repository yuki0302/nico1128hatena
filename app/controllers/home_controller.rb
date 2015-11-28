class HomeController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
  	entry_url = params[:url]
    until entry_url.last == "/"
      entry_url = entry_url + "/"
    end
  	@entry = Entry.where(url: entry_url)
  	if @entry == []
      Crawler::Hatena::Parser.save_keywords(entry_url)
      @entry = Entry.where(url: entry_url)
    end
    if @entry.last.bookmarks == []
      render json: Bookmark.limit(20)
    else
      render json: @entry.last.bookmarks
    end
  end
end