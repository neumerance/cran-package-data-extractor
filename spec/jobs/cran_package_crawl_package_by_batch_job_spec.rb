require 'rails_helper'
include ActiveJob::TestHelper

describe CranPackageCrawlPackageByBatchJob, type: :job do
  describe "#perform_later" do
    before do
      ActiveJob::Base.queue_adapter = :test
    end

    after do
      clear_enqueued_jobs
    end

    it "inqueues" do
      expect {
        described_class.perform_later
      }.to have_enqueued_job
    end
  end
end
