require 'rails_helper'

describe PackageVersion do
  describe 'associations' do
    it { should belong_to(:package) }
    it { should have_many(:package_maintainers) }
    it { should have_many(:package_authors) }
  end
end
