RSpec.describe ImagesDownloader::CLI do
  subject(:klass_call) { described_class.new.call(urls) }

  let(:urls) { File.open("spec/fixtures/images.txt").read }

  it "download images from images.txt file" do
    VCR.use_cassette("images") do
      klass_call
      expect(Dir.empty?("tmp/images")).to be_falsey
    end
  end
end
