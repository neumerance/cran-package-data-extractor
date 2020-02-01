require 'rails_helper'

describe CranPackage::List do
  subject do
    CranPackage::List.list
  end

  before do
    mock_package_list
  end

  let(:expectation) { [['A3', 'aaSEA']] }

  it 'returns lists of package names' do
    expect(subject).to eq expectation
  end
end
