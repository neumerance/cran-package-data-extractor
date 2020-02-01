module CranPackage
  module Exceptions
    class UnableToReachPackageRepository < StandardError
    end

    class UnableToRetrievePackageList < StandardError
    end
  end
end
