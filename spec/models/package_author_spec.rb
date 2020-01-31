require 'rails_helper'

describe PackageAuthor do
  describe 'associations' do
    it { should belong_to(:package_version) }
    it { should belong_to(:contributor) }
  end
end
