RSpec.describe ImagesDownloader::FetchUrls do
  subject(:klass_call) { described_class.new.call(urls_collection) }

  context "when happy path" do
    let(:urls_collection) {
      [
        "https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png",
        "https://api.time.com/wp-content/uploads/2015/02/cats.jpg?quality=85&w=1024&h=512&crop=1"
      ]
    }

    it "download images from url" do
      VCR.use_cassette("images") do
        klass_call
        expect(File.exist?("tmp/images/Thinking-of-getting-a-cat.png")).to be_truthy
        expect(File.exist?("tmp/images/cats.jpg")).to be_truthy
      end
    end
  end

  context "when unhappy path" do
    let(:urls_collection) {
      [
        "https://icatcare.org/about/",
        "https://icatcare.org/invalid/url/cat.png"
      ]
    }

    it "not downloaded other files" do
      VCR.use_cassette("images") do
        klass_call
        expect(File.exist?("tmp/images/about")).to be_falsey
      end
    end

    it "skipped not 200 urls" do
      VCR.use_cassette("images") do
        klass_call
        expect(File.exist?("tmp/images/cat.png")).to be_falsey
      end
    end
  end
end
