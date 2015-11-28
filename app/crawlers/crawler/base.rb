# encoding: UTF-8
module Crawler
  class Base
    class << self

      def try(func, error_func:nil)
        begin
          return func.call
        rescue => e
          Rails.logger.error "Error occurred. #{e.inspect}"
          error_func.call if ! error_func.nil?
          return "undefined"
        end
      end

      def default_conn(url)
        conn = Faraday.new(url: url) do |f|
          f.adapter Faraday.default_adapter
          f.use Faraday::Response::RaiseError
          f.use FaradayMiddleware::FollowRedirects
        end
      end

      def parse(html)
        fragment = Nokogiri::HTML.fragment html
      end

      def parse_rss(html)
        Nokogiri::XML(html)
      end

      def get_image_size(url_or_file)
        # こっちでも良いが、Fastのが早い
#         open(url_or_file, {"Referer" => "http://mery.jp/search"}) do |fh|
#           data = fh.read
#           return ImageSize.new(data).size
#         end
        FastImage.size(url_or_file, {custom_header: {"Referer" => "http://b.hatena.ne.jp/"}})
      end

      def get_html(url_or_file)
        if url_or_file =~ /^https?/
          get_html_by_url(url_or_file, referer: "http://b.hatena.ne.jp/")
        else
          get_html_by_file(url_or_file)
        end
      end

      def get_html_by_url(url, referer: nil)
        if url.blank?
          Rails.logger.error "url is empty"
          return nil
        end
        begin
          conn = default_conn(url)
          res = conn.get do |req|
            if referer.nil?
              req.headers["referer"] = referer
            end
          end
          return res.body
        rescue => e
          Rails.logger.error "get error url: #{url}"
          Rails.logger.error "connection error: #{e.inspect}"
          return nil
        end
      end

      def get_html_by_file(file_location)
        File.read(file_location, encoding: Encoding::UTF_8)
      end

      def put_to_file(url, filename)
        html = get_html_by_url(url, referer: "http://b.hatena.ne.jp/")
        if html.blank?
          Rails.logger.error "empty string url: #{url} filename: #{filename}"
          return false
        end

        # create
        dir = File.dirname(filename)
        if ! File.exists?(dir)
          FileUtils.mkdir_p(dir)
        end

        # バイナリ文字が含まれることに注意
        size = File.open(filename, 'wb') {|f| f.write(html) }
        Rails.logger.info "created size: #{size} name: #{filename}"
      end

      def put_file_by_url(url, file_type:, dir_name:, override: false)
        file_name = file_type + ".#{Date.today.strftime("%Y%m%d")}"
        file_location = "#{dir_name}/#{file_name}"
        if override
          put_to_file(url, file_location)
        else
          if File.exists?(file_location)
            # nothing
          else
            put_to_file(url, file_location)
          end
        end
        file_location
      end
    end
  end
end
