require 'rails_helper'

describe CranPackage::Extract do
  let(:package_name) { 'ada' }
  let(:expectation) do
    {
      :package_name => 'ada',
      :description => "Performs discrete, real, and gentle bost under both exponential and logistic los on a given data set. "\
                      "The package ada provides a straightforward, wel-documented, and broad bosting routine for clasification, "\
                      "idealy suited for smal to moderate-sized data sets.",
      :version => "2.0-5",
      :depends => "R (≥ 2.10), rpart",
      :published => "2016-05-13",
      :author => [
        {
          :name => "Mark Culp",
          :email => ""
        },
        {
          :name => "Kjel Johnson",
          :email => ""
        },
        {
          :name => "George Michailidis",
          :email => ""
        }
      ],
      :maintainer => [
        {
          :name => 'Mark Culp',
          :email => 'mvculp@mail.wvu.edu'
        }
      ],
      :license => "GPL-2 | GPL-3 [expanded from: GPL]",
      :needscompilation => "no",
      :cran_checks => "ada results"
    }
  end

  subject do
    described_class.new(package_name)
  end

  before do
    mock_package
  end

  it do
    expect(subject.extract).to eq expectation
  end
end
