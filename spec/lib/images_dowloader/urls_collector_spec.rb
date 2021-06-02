RSpec.describe ImagesDownloader::UrlsCollector do
  subject(:valid_urls) { described_class.new }

  let(:ary) {
    [
      "https://icatcare.org/app/uploads/2018/07/Thinking-of-getting-a-cat.png",
      "https://api.time.com/wp-content/uploads/2015/02/cats.jpg?quality=85&w=1024&h=512&crop=1",
      "ttps://www.youube.cm/cat.png",
      "qwerty/asdf"
    ]
  }

  it "urls collection is Array" do
    valid_urls.collect_from(ary)
    expect(valid_urls.collection).to be_kind_of(Array)
  end

  it "reduce invalid urls" do
    valid_urls.collect_from(ary)
    expect(valid_urls.collection).not_to include("qwerty/asdf")
    expect(valid_urls.collection).not_to include("ttps://www.youube.cm/cat.png")
  end
end
