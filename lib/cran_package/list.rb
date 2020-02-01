module CranPackage
  class List
    PACKAGE_LIST_URL = "https://cran.r-project.org/src/contrib/PACKAGES".freeze
    BATCH_SIZE = 500.freeze

    class << self
      def list
        content.split("\n\n").map do |package|
          row = package.split("\n").first.split(":")
          if row.first == "Package"
            row.last.squish.strip
          end
        end.flatten.compact.uniq.each_slice(BATCH_SIZE).to_a
      end

      private

      def content
        response = HTTParty.get(PACKAGE_LIST_URL)
        if response.success?
          response.body
        else
          raise Exceptions::UnableToRetrievePackageList
        end
      end
    end
  end
end
