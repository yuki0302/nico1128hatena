module Crawler
  module Hatena
    class Parser < Base
      class << self
        def save_keywords(url)
          url = "http://b.hatena.ne.jp/entry/" + url.gsub(/(http|https)/, "/").delete("/, :") + "/"
          html = Crawler::Base.get_html(url)
          f = Crawler::Base.parse(html)
          keywords = try(->{
            f.search("meta")[1]["content"].split(",")
          })
          #返り値はArray
          keywords.each do |keyword|
            if Keyword.where(name: keyword) == []
              k = Keyword.create(name: keyword)
              k.save
            end
          end
        end

        def parse_rss(keyword)
          require 'open-uri'
          url =  "http://b.hatena.ne.jp/keyword/" + URI::encode(keyword) + "?mode=rss&sort=count"
          html = Crawler::Base.get_html(url)
          pr = Crawler::Base.parse_rss(html)


          pr.elements.search("item").map do |item|
            title = try(->{
              item.children.search("title").text
            })
            image_url = try(->{
              content = item.children[7].children.text
              img_url = content.scan(/img.+src=[\"|\']?([\-_\.\!\~\*\'\(\)a-zA-Z0-9\;\/\?\:@&=\$\,\%\#]+\.(jpg|jpeg|png))/i).first.first
            })
            url = try(->{
              item.search("link").children.text
            })
            desc = try(->{
              item.search("description").text
            })
            posted_at = try(->{
              str = item.elements[4].text
              datetime = DateTime.parse(str)
            })
            if image_url == "undifined"
              image_url = "http://www.gpn.jp/econet/images/img_noimage.jpg"
            end

            {title: title, url: url, image_url: image_url, desc: desc, original_posted_at: posted_at}
            bm = Bookmark.create(title: title, url: url, image_url: image_url, desc: desc, original_posted_at: posted_at)
            bm.save
          end
        end
      end
    end
  end
end
