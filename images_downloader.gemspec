$:.push(File.expand_path("lib", __dir__))
require_relative "lib/images_downloader/version"

Gem::Specification.new do |spec|
  spec.name = "images_downloader"
  spec.version = ImagesDownloader::VERSION
  spec.authors = ["Vyacheslav Kuzharov"]
  spec.email = ["vyacheslav.kuzharov@gmail.com"]

  spec.summary = "Downloading images from a given plain text file"
  spec.description = "Will be implemented later"
  spec.homepage = "https://github.com/VyacheslavKuzharov/images_downloader"
  spec.license = "MIT"

  spec.files = Dir["{lib}/**/*", "README.md"]
  spec.executables = "images-downloader"
  spec.require_paths = ["lib"]
  spec.bindir = "bin"

  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "standard", "~> 1.0"
end
