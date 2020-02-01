class CranPackageCrawlPackagesJob < ApplicationJob
  queue_as :default

  def perform(package_lists)
    package_lists.each do |package_name|
      Rails.logger.info "CranPackage: processing package <#{package_name}>"
      begin
        summary = CranPackage::Extract.new(package_name).extract
        CranPackage::StoreSummary.new(summary).store
      rescue UnableToReachPackageRepository => _e
        Rails.logger.error "CranPackage: Package repository can not be reach."
      rescue UnableToRetrievePackageList => _e
        Rails.logger.error "CranPackage: Unable to retrieve package lists."
      rescue StandardError => e
        Rails.logger.error "CranPackage: #{e.message}"
        Rails.logger.error e.backtrace
      end
    end
  end
end
