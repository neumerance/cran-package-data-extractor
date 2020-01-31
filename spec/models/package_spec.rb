require 'rails_helper'

describe Package do
  describe 'associations' do
    it { should have_many(:package_versions) }
  end
end
