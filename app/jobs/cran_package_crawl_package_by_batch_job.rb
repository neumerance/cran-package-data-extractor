class CranPackageCrawlPackageByBatchJob < ApplicationJob
  queue_as :default

  def perform
    batches = CranPackage::List.list
    batches.each do |batch|
      CranPackageCrawlPackagesJob.perform_later(batch)
    end

    # reschedule for the next day
    CranPackageCrawlPackageByBatchJob.set(
      wait_until: 1.day.from_now.beginning_of_day
    ).perform_later
  end
end
