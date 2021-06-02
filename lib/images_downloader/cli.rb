require "images_downloader/urls_collector"
require "images_downloader/fetch_urls"

module ImagesDownloader
  class CLI
    def initialize
      @urls = UrlsCollector.new
    end

    def call(io, argv)
      io.each_line do |line|
        ary = build_ary(line)
        urls.collect_from(ary)
      end

      FetchUrls.new.call(urls.collection)
    end

    private

    attr_reader :urls

    def build_ary(line)
      line.strip.split(" ")
    end
  end
end
