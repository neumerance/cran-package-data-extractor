require 'rails_helper'

describe CranPackage::Sanitize do
  let(:sample1) { 'Mang Jose <mang at jose.com>' }
  let(:sample2) { 'Super Kamote <super@kamote.com>[aut, cre], Mang Berneng [aut]' }

  describe '#sanitize' do
    let(:expectation) { 'Super Kamote super@kamote.com, Mang Berneng' }

    it 'sanitize string' do
      expect(described_class.sanitize(sample2)).to eq expectation
    end
  end

  describe '#sanitize_user_data' do
    let(:expectation) do
      {
        :name => 'Mang Jose',
        :email => 'mang@jose.com'
      }
    end

    it 'returns sanitized users data' do
      expect(described_class.sanitize_user_data(sample1)).to eq expectation
    end
  end
end
