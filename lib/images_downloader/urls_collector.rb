module ImagesDownloader
  class UrlsCollector
    attr_reader :collection

    def initialize
      @collection = []
    end

    def collect_from(ary)
      ary.each { |url| collection << url if looks_like_url?(url) }
    end

    private

    def looks_like_url?(str)
      uri = URI.parse(str)
      uri.is_a?(URI::HTTP) && !uri.host.nil?
    rescue URI::InvalidURIError
      false
    end
  end
end
