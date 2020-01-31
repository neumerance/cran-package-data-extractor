class CranPackageCrawlerJobJob < ApplicationJob
  queue_as :default

  def perform
    package_batch_list = CranPackage::List.list
    package_batch_list.each do |batch|
      batch.each do |package_name|
        package_summary = CranPackage::Extract.new(package_name).extract
        CranPackage::Store.new(package_summary).store
      end
    end
  end
end
