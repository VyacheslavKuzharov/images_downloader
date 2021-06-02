require "open-uri"
require "net/http"
require "fileutils"

module ImagesDownloader
  class FetchUrls
    PATH = "tmp/images".freeze

    def call(urls)
      urls.each { |url| download(url) if ok?(url) }
    end

    private

    def ok?(url)
      uri = URI(url)
      res = Net::HTTP.get_response(uri)

      res.is_a?(Net::HTTPSuccess) && res["content-type"]&.start_with?("image")
    end

    def download(url)
      path = "#{PATH}/#{filename(url)}"
      return if File.exist?(path)

      io = URI.parse(url).open

      case io
      when StringIO
        File.open(path, "w") { |f| f.write(io.read) }
      when Tempfile
        io.close
        FileUtils.mv(io.path, path)
      end
    end

    def filename(url)
      url.split("/").last.split("?").first
    end
  end
end
