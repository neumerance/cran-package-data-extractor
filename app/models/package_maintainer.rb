class PackageMaintainer < ApplicationRecord
  belongs_to :package_version
  belongs_to :contributor
end
