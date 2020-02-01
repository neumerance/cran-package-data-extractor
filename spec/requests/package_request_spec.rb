require 'rails_helper'

describe PackagesController, type: :request do
  let(:count) { 10 }
  let!(:package_versions) do
    FactoryBot::create_list(:package_version, count)
  end
  let(:json_response) do
    JSON.parse(response.body)
  end

  it 'list package versions' do
    get packages_path

    expect(response).to have_http_status(:success)
    expect(json_response.size).to be count
  end

  it 'enqueues CranPackageCrawlPackageByBatchJob' do
    get enqueu_crawlers_packages_path
    expect(json_response['message']).to include("Package crawler enqueued, scheduled to run on:")
  end
end
