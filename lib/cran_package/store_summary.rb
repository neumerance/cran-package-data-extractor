module CranPackage
  class StoreSummary
    def initialize(package_summary)
      @summary = package_summary
    end

    def store
      create_package
      create_package_version(@summary[:version], @summary[:published])
      @summary[:author].each do |author|
        create_contributor(author[:name], author[:email])
        create_package_author
      end
      @summary[:maintainer].each do |author|
        create_contributor(author[:name], author[:email])
        create_package_maintainer
      end
    end

    private

    def create_package
      @package ||= Package.find_or_create_by(name: @package_name).update(
        name: @summary[:package_name],
        title: @summary[:title],
        description: @summary[:description]
      )
    end

    def create_package_version(version, published)
      @package_version ||= PackageVersion.find_or_create_by(
        package: @package,
        version: version
      ).update(published: published)
    end

    def create_package_author
      @package_author ||= PackageAuthor.find_or_create_by(
        package_version: @package_version,
        contributor: @contributor
      )
    end

    def create_package_maintainer
      @package_maintainer ||= PackageMaintainer.find_or_create_by(
        package_version: @package_version,
        contributor: @contributor
      )
    end

    def create_contributor(name, email)
      @contributor ||= Contributor.find_or_create_by(name: name).update(email: email)
    end
  end
end
