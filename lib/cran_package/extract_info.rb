require 'open-uri'
require 'rubygems/package'
require 'zlib'

module CranPackage
  class ExtractInfo
    class << self
      def extract(file_path:)
        tar_extract = Gem::Package::TarReader.new(Zlib::GzipReader.open(file_path))
        tar_extract.rewind
        file = tar_extract.detect { |entry| entry.full_name.include?('DESCRIPTION') }
        tar_extract.close
        file
      end
    end
  end
end
