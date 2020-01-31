require 'rails_helper'

describe Contributor do
  describe 'associations' do
    it { should have_many(:package_maintainers) }
    it { should have_many(:package_authors) }
  end
end
