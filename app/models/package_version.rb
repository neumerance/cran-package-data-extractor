class PackageVersion < ApplicationRecord
  belongs_to :package
  has_many :package_maintainers
  has_many :package_authors
end
