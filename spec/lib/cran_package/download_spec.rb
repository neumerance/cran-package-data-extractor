require 'rails_helper'

describe CranPackage::Download do
  let(:pack_name) { 'abc.data' }

  subject do
    described_class.new(pack_name).download
  end

  after do
    FileUtils.rm subject
  end

  it 'download package file to tmp' do
    expect(File.file?(subject)).to be_truthy
  end
end
