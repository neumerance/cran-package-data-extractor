class Contributor < ApplicationRecord
  has_many :package_authors
  has_many :package_maintainers
end
