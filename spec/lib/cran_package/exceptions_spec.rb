require 'rails_helper'

describe CranPackage::Exceptions do
  describe 'UnableToReachPackageRepository' do
    let(:package_name) { 'ada' }

    before do
      mock_package_exception
      mock_package_list_exception
    end

    subject do
      CranPackage::Extract.new(package_name).extract
    end

    it 'raise exception' do
      expect { subject }.to raise_error(CranPackage::Exceptions::UnableToReachPackageRepository)
    end
  end

  describe 'UnableToRetrievePackageList' do
    let(:package_name) { 'ada' }

    before do
      mock_package_exception
      mock_package_list_exception
    end

    subject do
      CranPackage::List.list
    end

    it 'raise exception' do
      expect { subject }.to raise_error(CranPackage::Exceptions::UnableToRetrievePackageList)
    end
  end
end
