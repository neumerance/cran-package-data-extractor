class CranPackageCrawlPackageByBatchJob < ApplicationJob
  queue_as :default

  def perform
    batches = CranPackage::List.list
    batches.each do |batch|
      CranPackageCrawlPackagesJob.perform_later(batch)
    end
  end
end
