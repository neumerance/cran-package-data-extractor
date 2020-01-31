require 'open-uri'

module Crawlers
  module CranPackageCrawler
    class Extract
      class << self
        def extract(file_path:, &block)
          tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.open('Path/To/myfile.tar.gz'))
          tar_extract.rewind
          tar_extract.each do |entry|
            yield if block_given
          end
          tar_extract.close
        end
      end
    end
  end
end
