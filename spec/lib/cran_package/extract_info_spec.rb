require 'rails_helper'

describe CranPackage::ExtractInfo do
  let(:pack_name) { 'abc.data' }
  let(:file_path) do
    CranPackage::Download.new(pack_name).download
  end

  subject do
    CranPackage::ExtractInfo.extract(file_path: file_path).read
  end

  it 'return the description content of the package' do
    expect(subject).to be_present
  end
end
