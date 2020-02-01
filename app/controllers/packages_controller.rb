class PackagesController < ApplicationController
  def index
    render json: PackageVersion.all
  end

  def enqueu_crawlers
    schedule = 1.day.from_now.beginning_of_day
    CranPackageCrawlPackageByBatchJob.set(
      wait_until: schedule
    ).perform_later
    render json: { status: 200, message: "Package crawler enqueued, scheduled to run on: #{schedule}" }
  end
end
