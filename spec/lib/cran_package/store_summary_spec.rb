require 'rails_helper'

describe CranPackage::StoreSummary do
  let(:package_name) { 'ada' }
  let(:package_summary) do
    CranPackage::Extract.new(package_name).extract
  end
  let(:version) do
    subject.package_versions.last
  end

  subject do
    Package.find_by_name(package_name)
  end

  before do
    mock_package
    described_class.new(package_summary).store
  end

  it 'creates package' do
    expect(subject).to be_present
    expect(subject.name).to eq package_summary[:package_name]
    expect(subject.title).to eq package_summary[:title]
    expect(subject.description).to eq package_summary[:description]
  end

  it 'has version' do
    expect(version).to be_present
    expect(version.version).to eq package_summary[:version]
  end

  it 'has authors' do
    expect(version.package_authors.size).to eq package_summary[:author].size
  end

  it 'has maintainers' do
    expect(version.package_maintainers.size).to eq package_summary[:maintainer].size
  end
end
